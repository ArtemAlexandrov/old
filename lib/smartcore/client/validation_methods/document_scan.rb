module Smartcore
  class Client

    def upload_document_scan(user_token, base64doc)
      #   TODO: implement this
    end

    def list_document_scans(page, per_page)
      #   TODO: implement this
    end

    def confirm_document_scan(document_scan_id, comment, base64doc)
      verify_document_scan(document_scan_id, comment, base64doc, true)
    end

    def decline_document_scan(document_scan_id, comment, base64doc)
      verify_document_scan(document_scan_id, comment, base64doc, false)
    end

    def verify_document_scan(document_scan_id, comment, base64doc, confirmed)
      #   TODO: implement this
    end
  end
end
