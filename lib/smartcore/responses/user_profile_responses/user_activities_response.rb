module Smartcore
  class UserActivitiesResponse < SuccessResponse

    attribute :activities, Array[Smartcore::Models::UserActivity]

  end
end
