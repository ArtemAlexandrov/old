module Smartcore
  class UserProfileDeleteRequest < BaseRequest

    attribute :user_token, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.delete_profile_create_request_path
    end
  end
end
