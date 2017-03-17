module Smartcore
  ApiClientNotAuthorized   = Class.new(StandardError)
  ApiClientInvalidToken    = Class.new(StandardError)

  BadResponseError         = Class.new(StandardError)
  BadResponseFormat        = Class.new(StandardError)

  NotFoundError            = Class.new(StandardError)
  UserVerificationRequired = Class.new(StandardError)
  BadUserToken             = Class.new(StandardError)
  UserIsLocked             = Class.new(StandardError)
end
