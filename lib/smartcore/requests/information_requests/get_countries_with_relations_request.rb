module Smartcore
  class GetCountriesWithRelationsRequest < BaseRequest

    attribute :country_id,    String
    attribute :include_relations, Boolean, default: true
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
