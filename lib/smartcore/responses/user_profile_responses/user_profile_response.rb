module Smartcore
  class UserProfileResponse < SuccessResponse

    attribute :profile,                   Smartcore::Models::User
    attribute :token,                     String
    attribute :email_confirmation_token,  String

  end
end
