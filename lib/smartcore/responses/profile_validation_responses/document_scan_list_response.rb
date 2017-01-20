module Smartcore
  class DocumentScanListResponse < SuccessResponse

    attribute :document_scans, Array[Smartcore::Models::DocumentScan]

  end
end
