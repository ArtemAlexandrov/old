module Smartcore
  class UserProfileDeleteListRequest < BaseRequest

    attribute :page,     Integer, default: 1
    attribute :per_page, Integer, default: 20

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileDeleteListResponse.new(JSON.parse(response.body)).delete_requests
      else
        process_error(response)
      end
    end

    def path
      router.delete_profile_requests_list_path
    end
  end
end
