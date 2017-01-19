module Smartcore
  class Client

    def user_profiles(query, page, per_page)

    end

    def user_profile_registration(user_params)
      UserProfileRegistrationRequest.new(user_params).execute
    end

    def user_profile(user_token)

    end

    def user_profile_update(user_token, user_params)

    end

    def user_profile_update_avatar(user_token, base64doc)

    end

    def user_profile_delete_request(user_token)

    end

    def delete_profile_requests_list(page, per_page)

    end

    def delete_profile_request_confirm(request_id, profile_id)

    end


  end
end
