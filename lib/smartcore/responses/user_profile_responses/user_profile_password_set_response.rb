module Smartcore
  class UserProfilePasswordSetResponse < SuccessResponse

    attribute :profile,                   Smartcore::Models::User
    attribute :confirmation_token,        String

  end
end
