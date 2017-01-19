module Smartcore
  class UserProfileDeleteListResponse < SuccessResponse

    attribute :delete_requests, Array[Smartcore::Models::DeleteRequest]

  end
end
