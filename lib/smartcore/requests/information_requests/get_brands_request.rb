module Smartcore
  class GetBrandsRequest < BaseRequest

    def execute
      response = execute_request
      if response.status == success_status
        Smartcore::BrandsResponse.new(JSON.parse(response.body)).brands
      else
        process_error(response)
      end
    end

    def path
      router.information_brands_path
    end

  end
end
