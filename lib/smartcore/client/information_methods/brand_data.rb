module Smartcore
  class Client

    def brands_list
      GetBrandsRequest.new.execute
    end

    def brand_with_relations(brand_id = nil)
      GetBrandWithRelationsRequest.new(id: brand_id).execute
    end

    def brands_with_relations_list
      GetBrandsWithRelationsRequest.new.execute
    end


  end
end
