module Smartcore
  class UserProfilesRequest < TokenRequest

    attribute :limit, String
    attribute :offset, String
    attribute :custom_query, String


    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfilesResponse.new(JSON.parse(response.body)).profiles
      else
        process_error(response)
      end
    end

    def path
      router.user_sign_in_path
    end
  end
end
