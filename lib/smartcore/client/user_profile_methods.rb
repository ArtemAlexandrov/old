module Smartcore
  class Client

    def user_profiles(page = 1, per_page = 20, query = nil)
      Smartcore::UserProfilesRequest.new(api_token: self.token,
                                         custom_query: query,
                                         limit: per_page,
                                         offset: ((page - 1) * per_page)).execute
    end

    def user_profile_registration(user_params)
      Smartcore::UserProfileRegistrationRequest.new(user_params.merge(api_token: self.token)).execute
    end

    def user_profile(user_token)
      Smartcore::UserProfileRequest.new(api_token: self.token,
                                        user_token: user_token).execute
    end

    def user_profile_update(user_token, user_params)
      Smartcore::UserProfileUpdateRequest.new(user_params.merge(user_token: user_token, api_token: self.token)).execute
    end

    def user_profile_update_avatar(user_token, base64doc)
      Smartcore::UserProfileUpdateAvatarRequest.new(api_token: self.token,
                                                    user_token: user_token,
                                                    avatar: base64doc).execute
    end

    def upload_signature(user_token, base64doc)
      Smartcore::UserProfileSignatureUploadRequest.new(api_token: self.token,
                                                       user_token: user_token,
                                                       signature: base64doc).execute
    end

  end
end
