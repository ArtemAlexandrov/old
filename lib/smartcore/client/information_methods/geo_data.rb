module Smartcore
  class Client

    def cities_list
      Smartcore::GetCitiesRequest.new.execute
    end

    def countries_list
      Smartcore::GetCountriesRequest.new.execute
    end

    def countries_with_relations_list(country_id = nil)
      Smartcore::GetCountriesWithRelationsRequest.new(country_id: country_id).execute
    end

  end
end
