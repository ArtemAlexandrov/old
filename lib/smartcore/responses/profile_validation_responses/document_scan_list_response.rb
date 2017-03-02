module Smartcore
  class DocumentImageListResponse < SuccessResponse

    attribute :document_scans, Array[Smartcore::Models::DocumentImage]

  end
end
