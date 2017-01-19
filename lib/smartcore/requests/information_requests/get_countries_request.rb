module Smartcore
  class GetCountriesRequest < BaseRequest

    def execute
      responce = execute_request
      if responce.status == success_status
        Smartcore::CountriesResponse.new(JSON.parse(responce.body)).countries
      else
        process_error(responce)
      end
    end

    def path
      router.information_countries_path
    end
  end
end
