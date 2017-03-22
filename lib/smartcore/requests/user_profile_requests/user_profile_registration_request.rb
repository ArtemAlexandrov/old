module Smartcore
  class UserProfileRegistrationRequest < TokenRequest

    include Smartcore::UserData
    attribute :password, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_create_path
    end

    def process_error(response)
      if response.status == 422
        response_json = JSON.parse(response.body)
        if response_json['error'] == 'validation_error'
          profile = Smartcore::Models::User.new(response_json['profile'])
          profile.init_errors_by_json(response_json['messages'])
          profile
        else
          super(response)
        end
      end
    end

  end
end
