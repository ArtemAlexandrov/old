module Smartcore
  class Client

    def users_activities(page = 1, per_page = 20, profile_id: nil, type: nil)
      Smartcore::UserActivitiesRequest.new(api_token: self.token,
                                           page: page,
                                           per_page: per_page,
                                           profile_id: profile_id,
                                           type: type).execute
    end

    def user_profile_by_id(profile_id)
      Smartcore::UserProfilesRequest.new(api_token: self.token,
                                         profile_id: profile_id).execute
    end

    def destroy_user_profile_by_id(profile_id)
      Smartcore::UserProfileDestroyRequest.new(api_token: self.token,
                                               id: profile_id).execute
    end

    def user_profiles(page = 1, per_page = 20, where_conditions = nil, orders = nil)
      Smartcore::UserProfilesRequest.new(api_token: self.token,
                                         page: page,
                                         per_page: per_page,
                                         where: where_conditions,
                                         order: orders).execute
    end

    def user_profile_registration(user_params)
      Smartcore::UserProfileRegistrationRequest.new(user_params.merge(api_token: self.token)).execute
    end

    def user_profile(user_token)
      Smartcore::UserProfileRequest.new(api_token: self.token,
                                        user_token: user_token).execute
    end

    def user_profile_create(user_params, skip_validate: false)
      Smartcore::UserProfileCreateRequest.new(user_params.merge(api_token: self.token,
                                                                skip_validate: skip_validate)).execute
    end

    def user_profile_update(user_token, user_params, skip_validate: false)
      Smartcore::UserProfileUpdateRequest.new(user_params.merge(user_token: user_token,
                                                                api_token: self.token,
                                                                skip_validate: skip_validate)).execute
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

    def user_profile_set_mark(user_token, key, value)
      Smartcore::UserProfileSetMarkRequest.new(api_token: self.token,
                                               user_token: user_token,
                                               key: key,
                                               value: value).execute
    end

    def send_user_session_data(user_token, check_in, active_time, url, title)
      Smartcore::UserProfileSessionRequest.new(api_token: self.token,
                                               user_token: user_token,
                                               check_in: check_in,
                                               active_time: active_time,
                                               url: url,
                                               title: title).execute
    end

  end
end
