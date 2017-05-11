module Smartcore
  class UserProfileDestroyRequest < TokenRequest

    attribute :id, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.destroy_profile_request_path
    end
  end
end
