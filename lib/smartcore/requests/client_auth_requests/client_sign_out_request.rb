module Smartcore
  class ClientSignOutRequest < BaseRequest

    attribute :token,    String

    def execute
      response = execute_request
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.client_sign_out_path
    end
  end
end
