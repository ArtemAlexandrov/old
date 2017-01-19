module Smartcore
  class Client


    def list_social_profiles(page, per_page)
      #   TODO: implement this
    end

    def confirm_social_profile(profile_id, comment, base64doc)
      verify_social_profile(profile_id, comment, base64doc, true)
    end

    def decline_social_profile(profile_id, comment, base64doc)
      verify_social_profile(profile_id, comment, base64doc, false)
    end

    def verify_social_profile(profile_id, comment, base64doc, confirmed)
      #   TODO: implement this
    end


  end
end
