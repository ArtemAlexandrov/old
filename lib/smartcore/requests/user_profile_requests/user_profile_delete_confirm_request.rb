module Smartcore
  class UserProfileDeleteConfirmRequest < TokenRequest

    attribute :request_id, String
    attribute :profile_id, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.delete_profile_confirm_path
    end
  end
end
