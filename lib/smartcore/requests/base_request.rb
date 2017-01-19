require 'faraday'
module Smartcore
  class BaseRequest

    include Virtus.model

    def execute
      raise 'Abstract Method'
    end

    def execute_request
      post_json(path: path, data: attributes)
    end

    def execute_request_with_token
      post_json_with_token(path: path, data: attributes)
    end

    private

    def success_status
      200
    end

    def path
      raise 'Abstract Method'
    end

    def method
      'POST'
    end

    def post_json(path: nil, data: nil)
      uri = URI(Smartcore.uri)
      uri.path = File.join(uri.path, path) if path.present?

      conn = Faraday.new(url: uri) do |f|
        f.ssl.verify = false
        f.response :logger                  # log requests to STDOUT
        f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      conn.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def process_error(response)
      # HTTP: unprocessable entity -> returns JSON
      if response.status == 422
        json = JSON.parse(response.body)
        case json['error']
          when 'user_verification'
            raise Smartcore::UserVerificationRequired
          when 'bad_user_token'
            raise Smartcore::BadUserToken
          when 'user_locked'
            raise Smartcore::UserIsLocked
        end
        # HTTP unauthorized -> API client is not authorized.
      elsif response.status == 401
        # so, if we have any client token in cache,
        if Rails.cache.exist?(:api_token)
          # we should delete it
          Rails.cache.delete(:api_token)
          raise Smartcore::ApiClientInvalidToken
        else
          # in other case we have bad credentials
          raise Smartcore::ApiClientNotAuthorized
        end

        # HTTP not modified
        # HTTP not found
        # HTTP locked
        # -> we should do nothing and pass cause this error should be handled in children classes
      elsif response.status.in? [304, 404, 423]

        # any other codes are not used in standard cases
      else
        raise Smartcore::BadResponseError
      end
    rescue JSON::ParserError
      raise Smartcore::BadResponseFormat
    end

    def post_json_with_token(path: nil, data: {})
      retry_count = 0
      begin
        response = post_json(path: path, data: data.reverse_merge(api_token: token))
        Request.process_error(response) unless response.status == 200
        response
      rescue Smartcore::ApiClientInvalidToken
        retry if (retry_count += 1) < 3
      end
    end
  end
end
