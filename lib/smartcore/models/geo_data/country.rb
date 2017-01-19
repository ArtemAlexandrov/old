module Smartcore
  module Models
    class Country < BaseModel
      attribute :name,      String
      attribute :iso_code,      String
      attribute :cities,     Array[Smartcore::Models::City]
    end
  end
end
