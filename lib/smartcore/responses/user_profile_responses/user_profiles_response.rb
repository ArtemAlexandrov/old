module Smartcore
  class UserProfilesResponse < SuccessResponse

    attribute :profiles,  Array[Smartcore::Models::User]

  end
end
