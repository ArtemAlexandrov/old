module Smartcore
  class UserProfileWithDocumentsResponse < SuccessResponse

    attribute :profile,           Smartcore::Models::User
    attribute :document_images,   Array[Smartcore::Models::DocumentImage]

  end
end
