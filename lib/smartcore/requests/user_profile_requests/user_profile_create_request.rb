module Smartcore
  class UserProfileCreateRequest < TokenRequest

    include Smartcore::UserData
    attribute :password,       String
    attribute :city_id,        String
    attribute :skip_validate,  Boolean, default: false

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
          response = UserProfileResponse.new({profile: response_json['profile']})
          response.profile.init_errors_by_json(response_json['messages'])
          response
        else
          super(response)
        end
      end
    end

  end
end
