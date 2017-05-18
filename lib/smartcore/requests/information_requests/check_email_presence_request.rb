module Smartcore
  class CheckEmailPresenceRequest < BaseRequest
    attribute :email,    String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      elsif response.status == 404
        false
      else
        process_error(response)
      end
    end

    def path
      router.information_check_email_path
    end
  end
end
