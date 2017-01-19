module Smartcore
  class BrandsResponse < SuccessResponse

    attribute :brands, Array[Smartcore::Models::Brand]

  end
end
