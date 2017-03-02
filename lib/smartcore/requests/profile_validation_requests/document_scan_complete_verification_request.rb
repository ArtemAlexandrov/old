module Smartcore
  class DocumentImageCompleteVerificationRequest < TokenRequest

    attribute :document_scan_id,    String
    attribute :employee_id,         String
    attribute :comment,             String
    attribute :is_document_valid,   Boolean

    def execute
      response = execute_request_with_token
      if response.status == success_status
        true
      else
        process_error(response)
      end
    end

    def path
      router.document_scans_complete_verification_path
    end
  end
end
