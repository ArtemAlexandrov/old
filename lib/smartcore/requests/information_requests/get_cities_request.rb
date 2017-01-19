module Smartcore
  class GetCitiesRequest < BaseRequest

    def execute
      responce = execute_request
      if responce.status == success_status
        Smartcore::CitiesResponse.new(JSON.parse(responce.body)).cities
      else
        process_error(responce)
      end
    end

    def path
      '/cities'
    end
  end
end