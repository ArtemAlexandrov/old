module Smartcore
  class CountriesResponse < SuccessResponse

    attribute :countries, Array[Smartcore::Models::Country]

  end
end
