module Smartcore
  module Models
    class DocumentScan < BaseModel
      attribute :image, String
      attribute :document_id, String
      attribute :profile, Smartcore::Models::User
    end
  end
end
