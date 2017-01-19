module Smartcore
  class CitiesResponse < SuccessResponse

    attribute :cities, Array[Smartcore::Models::City]

  end
end
