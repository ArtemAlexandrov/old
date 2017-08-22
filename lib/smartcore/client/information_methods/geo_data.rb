module Smartcore
  class Client

    def cities_list
      Smartcore::GetCitiesRequest.new.execute
    end

    def regions_list
      Smartcore::GetRegionsRequest.new.execute
    end

    def region_with_relations_list(region_id)
      Smartcore::GetRegionsWithRelationsRequest.new(id: region_id).execute
    end

    def countries_list
      Smartcore::GetCountriesRequest.new.execute
    end

    def countries_with_relations_list
      Smartcore::GetCountriesWithRelationsRequest.new.execute
    end

    def country_with_relations_list(country_id)
      Smartcore::GetCountriesWithRelationsRequest.new(id: country_id).execute
    end

  end
end
