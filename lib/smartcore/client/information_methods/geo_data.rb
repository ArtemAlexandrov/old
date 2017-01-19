module Smartcore
  class Client

    def cities_list(page = 1, per_page = 20)
      Smartcore::GetCitiesRequest.new.execute
    end

    def countries_list(page = 1, per_page = 20)
      Smartcore::GetCountriesRequest.new.execute
    end

    def countries_with_relations_list(country_id = nil, page = 1, per_page = 20)
      Smartcore::GetCountriesWithRelationsRequest.new(country_id: country_id).execute
    end



  end
end
