module Smartcore
  class Client


    def list_social_profiles(page = 1, per_page = 25)
      Smartcore::UserSocialProfilesRequest.new(api_token: self.token,
                                               page: page,
                                               per_page: per_page).execute
    end

    def confirm_social_profile(profile_id, employee_id, comment, base64doc)
      verify_social_profile(profile_id, employee_id, comment, base64doc, true)
    end

    def decline_social_profile(profile_id, employee_id, comment, base64doc)
      verify_social_profile(profile_id, employee_id, comment, base64doc, false)
    end

    def verify_social_profile(profile_id, employee_id, comment, base64doc, confirmed)
      Smartcore::SocialScreenUploadRequest.new(api_token: self.token,
              profile_id: profile_id,
              social_screen: base64doc,
              state: confirmed ? 'verified' : 'rejected',
              employee_id: employee_id,
              comment: comment).execute
    end


  end
end
