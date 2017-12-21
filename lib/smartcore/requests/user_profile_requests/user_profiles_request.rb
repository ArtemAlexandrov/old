module Smartcore
  class UserProfilesRequest < TokenRequest

    attribute :page,         Integer
    attribute :per_page,     Integer
    attribute :profile_id,   String
    attribute :email,        String
    attribute :where,        Array[Smartcore::Condition]
    attribute :order,        Hash

    def execute
      response = execute_request_with_token
      if response.status == success_status
        if profile_id.present? || email.present?
          Smartcore::UserProfileWithDocumentsResponse.new(JSON.parse(response.body))
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
