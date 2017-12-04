module Smartcore
  class UserProfileCreateRequest < TokenRequest

    attribute :first_name,          String
    attribute :last_name,           String
    attribute :patronymic,          String

    attribute :login,               String
    attribute :email,               String
    attribute :phone_number,        String

    attribute :gender,              String # male|female
    attribute :birthday,            Date

    attribute :accept_term_at,      DateTime

    attribute :email_confirmed,     Boolean
    attribute :subscribed,          Boolean

    attribute :preferred_cigarette_brand,     Smartcore::Models::Brand
    attribute :preferred_cigarette_format,    Smartcore::Models::CigaretteFormat

    attribute :secondary_cigarette_brand,     Smartcore::Models::Brand
    attribute :secondary_cigarette_format,    Smartcore::Models::CigaretteFormat

    attribute :country,             Smartcore::Models::Country
    attribute :region,              Smartcore::Models::Region
    attribute :city,                Smartcore::Models::City

    attribute :street,              String
    attribute :postcode,            String
    attribute :marks,               Hash

    attribute :client,              String
    attribute :created_at,          DateTime
    attribute :email_confirmation_token,  String

    attribute :password,       String
    attribute :city_id,        String
    attribute :user_ip,        String
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
