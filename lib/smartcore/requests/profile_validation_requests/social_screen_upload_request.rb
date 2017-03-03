module Smartcore
  class SocialScreenUploadRequest < TokenRequest

    attribute :profile_id, String
    attribute :social_screen, String
    attribute :state, String
    attribute :employee_id, String
    attribute :comment, String
    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.upload_social_screen_path
    end
  end
end
