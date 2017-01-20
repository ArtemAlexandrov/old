module Smartcore
  class TokenRequest < BaseRequest
    attribute :api_token, String

    def post_json_with_token(path: nil, data: {})
      retry_count = 0
      begin
        response = post_json(path: path, data: data.reverse_merge(api_token: api_token))
        process_error(response) unless response.status == 200
        response
      rescue Smartcore::ApiClientInvalidToken
        retry if (retry_count += 1) < 3
      end
    end
  end
end
