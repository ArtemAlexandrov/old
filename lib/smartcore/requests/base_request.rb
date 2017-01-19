module Smartcore
  class BaseRequest
    include Virtus.model

    attribute :method, String, default: 'GET'
  end
end
