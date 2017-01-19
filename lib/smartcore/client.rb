require 'client/client_auth_methods'
require 'client/user_profile_methods'
require 'client/user_session_methods'
require 'client/user_validation_methods'
require 'client/user_password_methods'
require 'client/information_methods'

module Smartcore
  class Client

    include Virtus.model

    attribute :login,    String
    attribute :password, String
    attribute :token,    String

  end
end
