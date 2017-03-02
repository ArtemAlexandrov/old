module Smartcore
  class UserProfilesResponse < SuccessResponse

    attribute :profiles,  Array[Smartcore::Models::User]
    attribute :page,      Integer
    attribute :per_page,  Integer
    attribute :total,     Integer

  end
end
