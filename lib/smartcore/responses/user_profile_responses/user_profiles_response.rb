module Smartcore
  class UserProfilesResponse < SuccessResponse

    attribute :profiles,  Array[Smartcore::Models::User]
    attribute :total,     Integer

  end
end
