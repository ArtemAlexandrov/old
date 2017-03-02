module Smartcore
  class Client

    def staff_verification(profile_id, state)
      Smartcore::StaffVerificationRequest.new(api_token: self.token, profile_id: profile_id, state: state).execute
    end

  end
end
