module Smartcore
  module Models
    class Region < BaseModel
      attribute :name,       String
      attribute :country_id, String
      attribute :cities,     Array[Smartcore::Models::City]

      def title
        name
      end
    end
  end
end
