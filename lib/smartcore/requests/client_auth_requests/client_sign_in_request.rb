module Smartcore
  class ClientSignInRequest < BaseRequest

    attribute :login,    String
    attribute :password, String

    def execute
      response = execute_request
      if response.status == success_status
        Smartcore::ClientAuthResponce.new(JSON.parse(response.body)).token
      else
        process_error(response)
      end
    end

    def path
      router.client_sign_in_path
    end
  end
end
