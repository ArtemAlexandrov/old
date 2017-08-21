module Smartcore
  class RegionsResponse < SuccessResponse

    attribute :regions, Array[Smartcore::Models::Region]

  end
end
