module Smartcore
  module Models
    class Country < BaseModel
      attribute :title,      String
      attribute :cities,     Array[Smartcore::Models::City]
    end
  end
end
