module Smartcore
  class Client

    def upload_document_scan(user_token, base64doc)
      Smartcore::DocumentScanUploadRequest.new(user_token: user_token, document_scan: base64doc).execute
    end

    def list_document_scans(page = 1, per_page = 20)
      Smartcore::DocumentScanListRequest.new(offset: ((page - 1) * per_page), limit: per_page)
    end

    def confirm_document_scan(document_scan_id, employee_id, comment)
      verify_document_scan(document_scan_id, employee_id, comment, true)
    end

    def decline_document_scan(document_scan_id, employee_id, comment)
      verify_document_scan(document_scan_id, employee_id, comment, false)
    end

    def verify_document_scan(document_scan_id, employee_id, comment, confirmed)
      Smartcore::DocumentScanCompleteVerificationRequest.new(document_scan_id: document_scan_id,
                                                             employee_id: employee_id,
                                                             comment: comment,
                                                             is_document_valid: confirmed).execute
    end
  end
end
