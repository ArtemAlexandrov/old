module Smartcore
  class CitiesResponse < SuccessResponse

    attribute :regions, Array[Smartcore::Models::Region]

  end
end
