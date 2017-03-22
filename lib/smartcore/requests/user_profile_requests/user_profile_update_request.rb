module Smartcore
  class UserProfileUpdateRequest < TokenRequest

    attribute :user_token,                    String
    attribute :country_id,                    String
    attribute :city_id,                       String
    attribute :preferred_cigarette_brand_id,  String
    attribute :secondary_cigarette_brand_id,  String
    attribute :preferred_cigarette_format_id, String
    attribute :secondary_cigarette_format_id, String
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
