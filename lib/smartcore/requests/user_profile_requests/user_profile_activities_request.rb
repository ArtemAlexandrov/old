module Smartcore
  class UserActivitiesRequest < TokenRequest

    attribute :page,         Integer, default: 1
    attribute :per_page,     Integer, default: 25
    attribute :profile_id,   String
    attribute :type,         Array

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserActivitiesResponse.new(JSON.parse(response.body)).activities
      else
        process_error(response)
      end
    end

    def path
      router.user_activities_path
    end
  end
end
