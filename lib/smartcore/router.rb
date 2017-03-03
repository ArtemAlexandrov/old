module Smartcore
  class Router
    def client_sign_in_path
      '/auth/sign_in'
    end

    def client_sign_out_path
      '/auth/sign_out'
    end

    def get_users_path
      '/sessions/get_users'
    end

    def social_profiles_path
      '/sessions/social_profiles'
    end

    def batch_register_path
      '/session/batch_register'
    end

    def user_sign_in_path
      '/sessions/sign_in'
    end

    def user_update_path
      '/users/update'
    end

    def user_upload_avatar_path
      '/sessions/update_avatar'
    end

    def user_sign_out_path
      '/sessions/sign_out'
    end

    def user_create_path
      '/sessions/create'
    end

    def user_upload_document_scan_path
      '/users/upload_document_scan'
    end

    def upload_social_screen_path
      '/sessions/upload_social_screen'
    end

    def user_upload_signature_path
      '/users/upload_signature'
    end

    def user_confirm_password_reset_path
      '/users/password_confirm'
    end

    def user_password_reset_path
      '/users/password_reset'
    end

    def user_profile_path
      '/users/profile'
    end

    def user_oauth_sign_in_path
      '/sessions/oauth_signin'
    end

    def user_log_active_time_path
      '/sessions/log_user_active_time'
    end

    def information_cities_path
      '/cities'
    end

    def information_countries_path
      '/countries'
    end


    def information_brands_path
      '/brands'
    end

    def information_check_email_path
      '/unility/check_email_presence'
    end

    def document_scans_list_path
      '/document_scans'
    end

    def document_scans_complete_verification_path
      '/document_scans/complete_verification'
    end

    def delete_profile_create_request_path
      '/delete_profile/create_request'
    end

    def set_mark_path
      '/users/set_mark'
    end

    def delete_profile_requests_list_path
      '/delete_profile/list'
    end

    def delete_profile_confirm_path
      '/delete_profile/confirm'
    end

    def confirm_email_path
      '/users/confirm_email'
    end

    def staff_verification_path
      '/staff_verification'
    end

  end
end
