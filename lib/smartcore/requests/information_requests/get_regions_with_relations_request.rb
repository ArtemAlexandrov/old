module Smartcore
  class GetRegionsWithRelationsRequest < BaseRequest

    attribute :per_page, Integer, default: 500
    attribute :id, String
    attribute :include_relations, Boolean, default: true

    def execute
      response = execute_request
      if response.status == success_status
        if id.present?
          Smartcore::RegionResponse.new(JSON.parse(response.body)).region
        else
          Smartcore::RegionsResponse.new(JSON.parse(response.body)).regions
        end
      else
        process_error(response)
      end
    end

    def path
      router.information_regions_path
    end
  end
end
