module Smartcore
  module Models
    class DocumentImage < BaseModel
      attribute :document_type, String
      attribute :image_url, String
      attribute :verification_state, String
      attribute :verified_by, String
      attribute :profile, Smartcore::Models::User
      attribute :client, String
    end
  end
end
