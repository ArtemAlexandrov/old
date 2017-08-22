module Smartcore
  class GetRegionsWithRelationsRequest < BaseRequest

    attribute :per_page, Integer, default: 500
    attribute :id, String
    attribute :include_relations, Boolean, default: true

    def execute
      response = execute_request
      if response.status == success_status
        Smartcore::RegionsResponse.new(JSON.parse(response.body)).regions
      else
        process_error(response)
      end
    end

    def path
      router.information_regions_path
    end
  end
end
