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
      '/user/update'
    end

    def user_upload_avatar_path
      '/user/upload_avatar'
    end

    def user_sign_out_path
      '/sessions/sign_out'
    end

    def user_registration_path
      '/sessions/create'
    end

    def user_create_path
      '/user/create'
    end

    def user_upload_document_scan_path
      '/user/upload_document_scan'
    end

    def upload_social_screen_path
      '/sessions/upload_social_screen'
    end

    def user_upload_signature_path
      '/user/upload_signature'
    end

    def user_confirm_password_reset_path
      '/user/password_confirm'
    end

    def user_password_reset_path
      '/user/password_reset'
    end

    def user_password_change_path
      'user/password_change'
    end

    def user_profile_path
      '/user/profile'
    end

    def user_oauth_sign_in_path
      '/sessions/oauth_sign_in'
    end

    def user_log_active_time_path
      '/sessions/log_user_active_time'
    end

    def information_cities_path
      '/cities'
    end

    def information_regions_path
      '/regions'
    end

    def information_countries_path
      '/countries'
    end


    def information_brands_path
      '/brands'
    end

    def information_check_email_path
      '/sessions/check_email_presence'
    end

    def document_scans_list_path
      '/document_scans'
    end

    def signature_list_path
      '/sessions/signatures'
    end

    def document_scans_complete_verification_path
      '/document_scans/complete_verification'
    end

    def destroy_profile_request_path
      '/admin/destroy_user_profile'
    end

    def delete_profile_create_request_path
      '/delete_profile/create_request'
    end

    def set_mark_path
      '/user/set_mark'
    end

    def delete_profile_requests_list_path
      '/delete_profile/list'
    end

    def delete_profile_confirm_path
      '/delete_profile/confirm'
    end

    def confirm_email_path
      '/user/confirm_email'
    end

    def staff_verification_path
      '/staff_verification'
    end
    def user_activities_path
      '/sessions/users_activities'
    end

    def user_profile_session_path
      '/user/session/get_data'
    end
  end
end
