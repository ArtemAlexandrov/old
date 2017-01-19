module Smartcore
  module Models
    class Brand < BaseModel

      attribute :title,               String
      attribute :cigarette_formats,   Array[Smartcore::Models::CigaretteFormat]
    end
  end
end
