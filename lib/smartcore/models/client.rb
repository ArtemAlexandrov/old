module Smartcore
  module Models
    class Client
      include Virtus.model

      attribute :login,    String
      attribute :password, String
      attribute :token,    String

    end
  end
end
