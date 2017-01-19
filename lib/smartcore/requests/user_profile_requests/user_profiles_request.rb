module Smartcore
  class UserProfilesRequest < BaseRequest

    attribute :limit, String
    attribute :offset, String
    attribute :custom_query, String


    def execute
      responce = execute_request_with_token
      if responce.status == success_status
        Smartcore::UserProfilesResponse.new(JSON.parse(responce.body)).profiles
      else
        process_error(responce)
      end
    end

    def path
      router.user_sign_in_path
    end
  end
end
