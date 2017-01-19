module Smartcore
  module Models
    class Client
      include Virtus.model

      attribute :login,    String
      attribute :password, String
      attribute :token,    String

      def sign_in

      end

      def sign_out

      end

    end
  end
end
