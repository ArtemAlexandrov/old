module Smartcore
  class CheckEmailPresenceRequest < BaseRequest
    attribute :email,    String

    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        true
      else
        process_error(responce)
      end
    end

    def path
      '/utility/check_email_presence'
    end
  end
end
