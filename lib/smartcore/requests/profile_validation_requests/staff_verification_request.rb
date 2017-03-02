module Smartcore
  class StaffVerificationRequest < TokenRequest

    attribute :profile_id,    String
    attribute :state,         String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.staff_verification_path
    end
  end
end
