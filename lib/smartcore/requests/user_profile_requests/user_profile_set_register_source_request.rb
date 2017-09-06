module Smartcore
  class UserProfileSetRegisterSourceRequest < TokenRequest

    attribute :user_token, String
    attribute :id,         String
    attribute :value,      String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.user_set_register_source_path
    end
  end
end
