module Smartcore
  class UserProfileResponse < SuccessResponse

    attribute :profile,                   Smartcore::Models::User
    attribute :user_token,                     String
    attribute :email_confirmation_token,  String
    attribute :messages,                  Array

  end
end
