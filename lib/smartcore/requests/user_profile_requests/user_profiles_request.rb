module Smartcore
  class UserProfilesRequest < TokenRequest

    attribute :limit, String
    attribute :offset, String
    attribute :custom_query, String


    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfilesResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.get_users_path
    end
  end
end
