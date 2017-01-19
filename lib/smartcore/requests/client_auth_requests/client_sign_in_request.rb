module Smartcore
  class ClientSignInRequest < BaseRequest

    attribute :login,    String
    attribute :password, String

    def execute
      responce = execute_request
      if responce.status == success_status
        Smartcore::ClientAuthResponce.new(JSON.parse(responce.body)).token
      else
        process_error(responce)
      end
    end

    def path
      '/auth/signin'
    end
  end
end
