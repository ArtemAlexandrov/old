module Smartcore
  class Client

    def upload_document_scan(user_token, base64doc)
      Smartcore::DocumentImageUploadRequest.new(api_token: self.token,
                                               user_token: user_token,
                                               document_scan: base64doc).execute
    end

    def list_document_scans(page = 1, per_page = 20)
      Smartcore::DocumentImageListRequest.new(api_token: self.token,
                                             offset: ((page - 1) * per_page),
                                             limit: per_page).execute
    end

    def list_signatures(page = 1, per_page = 20)
      Smartcore::SignatureImageListRequest.new(api_token: self.token,
                                              offset: ((page - 1) * per_page),
                                              limit: per_page).execute
    end

    def confirm_document_scan(document_scan_id, employee_id, comment)
      verify_document_scan(document_scan_id, employee_id, comment, true)
    end

    def decline_document_scan(document_scan_id, employee_id, comment)
      verify_document_scan(document_scan_id, employee_id, comment, false)
    end

    def verify_document_scan(document_scan_id, employee_id, comment, confirmed)
      Smartcore::DocumentImageCompleteVerificationRequest.new(api_token: self.token,
                                                             document_scan_id: document_scan_id,
                                                             employee_id: employee_id,
                                                             comment: comment,
                                                             is_document_valid: confirmed).execute
    end
  end
end
