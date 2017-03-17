module Smartcore
  class UserProfilesRequest < TokenRequest

    attribute :page,         Integer
    attribute :per_page,     Integer
    attribute :profile_id,   String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        if profile_id.present?
          Smartcore::UserProfileResponse.new(JSON.parse(response.body)).profile
        else
          Smartcore::UserProfilesResponse.new(JSON.parse(response.body))
        end
      else
        process_error(response)
      end
    end

    def path
      router.get_users_path
    end
  end
end
