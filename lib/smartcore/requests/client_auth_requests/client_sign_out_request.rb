module Smartcore
  class ClientSignOutRequest < BaseRequest

    attribute :token,    String

    def execute
      responce = execute_request
      if responce.status == success_status
        true
      else
        process_error(responce)
      end
    end

    def path
      router.client_sign_out_path
    end
  end
end
