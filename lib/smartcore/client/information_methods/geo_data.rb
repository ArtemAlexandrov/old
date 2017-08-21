module Smartcore
  class Client

    def cities_list
      Smartcore::GetCitiesRequest.new.execute
    end

    def regions_list
      Smartcore::GetRegionsRequest.new.execute
    end

    def countries_list
      Smartcore::GetCountriesRequest.new.execute
    end

    def countries_with_relations_list
      Smartcore::GetCountriesWithRelationsRequest.new.execute
    end

    def country_with_relations_list(country_id)
      Smartcore::GetCountriesWithRelationsRequest.new(country_id: country_id).execute
    end

  end
end
