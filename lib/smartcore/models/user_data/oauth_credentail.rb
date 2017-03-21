module Smartcore
  module Models
    class OAuthCredential < BaseModel
      attribute :provider, String
      attribute :uid,      String
      attribute :info,     String
    end
  end
end
