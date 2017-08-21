module Smartcore
  module Models
    class Region < BaseModel
      attribute :name,       String
      attribute :country_id, String

      def title
        name
      end
    end
  end
end
