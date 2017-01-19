module Smartcore
  class GetCitiesRequest < BaseRequest

    def execute
      response = execute_request
      if response.status == success_status
        Smartcore::CitiesResponse.new(JSON.parse(response.body)).cities
      else
        process_error(response)
      end
    end

    def path
      router.information_cities_path
    end
  end
end
