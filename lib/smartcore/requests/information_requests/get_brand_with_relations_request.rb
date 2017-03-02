module Smartcore
  class GetBrandWithRelationsRequest < BaseRequest
    attribute :id, String

    def execute
      response = execute_request
      if response.status == success_status
        Smartcore::BrandResponse.new(JSON.parse(response.body)).brand
      else
        process_error(response)
      end
    end

    def path
      router.information_brands_path
    end

  end
end
