module Smartcore
  class DocumentScanUploadRequest < BaseRequest

    attribute :user_token, String
    attribute :document_scan, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body)).profile
      else
        process_error(response)
      end
    end

    def path
      router.user_upload_document_scan_path
    end
  end
end
