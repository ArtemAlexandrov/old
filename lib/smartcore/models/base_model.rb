

module Smartcore
  module Models
    class BaseModel
      include Virtus.model

      attribute :id,         String
    end
  end

end