module Smartcore
  class UserSocialProfilesRequest < TokenRequest

    attribute :page,         Integer
    attribute :per_page,     Integer

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfilesResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.social_profiles_path
    end
  end
end
