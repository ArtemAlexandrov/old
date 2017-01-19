module Smartcore
  module Models
    class Brand < BaseModel

      attribute :title,            String
      attribute :picture,          String
      attribute :cigarette_skus,   Array[Smartcore::Models::CigaretteFormat]

      def cigarette_formats
        cigarette_skus
      end
    end
  end
end
