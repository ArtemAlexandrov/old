module Smartcore
  class UserProfileSetMarkRequest < TokenRequest

    attribute :user_token, String
    attribute :key,        String
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
      router.set_mark_path
    end
  end
end
