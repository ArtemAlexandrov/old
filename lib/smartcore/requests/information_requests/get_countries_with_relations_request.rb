module Smartcore
  class GetCountriesWithRelationsRequest < BaseRequest

    attribute :id,    String
    attribute :include_relations, Boolean, default: true
    def execute
      response = execute_request
      if response.status == success_status
        if id.blank?
          Smartcore::CountriesResponse.new(JSON.parse(response.body)).countries
        else
          Smartcore::CountryResponse.new(JSON.parse(response.body)).country
        end
      else
        process_error(response)
      end
    end

    def path
      router.information_countries_path
    end
  end
end
