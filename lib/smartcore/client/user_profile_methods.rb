module Smartcore
  class Client

    def user_profiles(query = nil, page = 1, per_page = 20)
      Smartcore::UserProfilesRequest.new(custom_query: query, limit: per_page, offset: ((page - 1) * per_page)).execute
    end

    def user_profile_registration(user_params)
      Smartcore::UserProfileRegistrationRequest.new(user_params).execute
    end

    def user_profile(user_token)
      Smartcore::UserProfileRequest.new(user_token: user_token).execute
    end

    def user_profile_update(user_token, user_params)
      Smartcore::UserProfileUpdateRequest.new(user_params.merge(user_token: user_token)).execute
    end

    def user_profile_update_avatar(user_token, base64doc)
      Smartcore::UserProfileUpdateAvatarRequest.new(user_token: user_token, avatar: base64doc)
    end

    def user_profile_delete_request(user_token)
      #   TODO: implement this
    end

    def delete_profile_requests_list(page, per_page)
      #   TODO: implement this
    end

    def delete_profile_request_confirm(request_id, profile_id)
      #   TODO: implement this
    end

  end
end
