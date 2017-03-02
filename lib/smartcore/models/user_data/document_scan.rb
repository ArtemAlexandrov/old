module Smartcore
  module Models
    class DocumentScan < BaseModel
      attribute :document_type, String
      attribute :image_url, String
      attribute :verification_state, String
      attribute :verified_by, String
      attribute :profile, Smartcore::Models::User
    end
  end
end
