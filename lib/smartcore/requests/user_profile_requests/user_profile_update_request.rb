module Smartcore
  class UserProfileUpdateRequest < TokenRequest

    attribute :user_token, String
    include Smartcore::UserData

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body)).profile
      else
        process_error(response)
      end
    end

    def path
      router.user_update_path
    end

    def process_error(response)
      if response.status == 422
        json = JSON.parse(response.body)
        if json['error'] == 'validation_error'
          json
        else
          super(response)
        end
      end
    end
  end
end
