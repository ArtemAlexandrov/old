module Smartcore
  class GetCountriesRequest < BaseRequest

    def execute
      response = execute_request
      if response.status == success_status
        Smartcore::CountriesResponse.new(JSON.parse(response.body)).countries
      else
        process_error(response)
      end
    end

    def path
      router.information_countries_path
    end
  end
end
