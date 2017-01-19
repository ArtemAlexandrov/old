require 'smartcore/client/client_auth_methods'
require 'smartcore/client/user_profile_methods'
require 'smartcore/client/user_session_methods'
require 'smartcore/client/user_validation_methods'
require 'smartcore/client/user_password_methods'
require 'smartcore/client/information_methods'

module Smartcore
  class Client

    include Virtus.model

    attribute :login,    String
    attribute :password, String
    attribute :token,    String

  end
end
