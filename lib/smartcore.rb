require 'virtus'
require 'rails'

require 'smartcore/version'
require 'smartcore/errors'
require 'smartcore/models'
require 'smartcore/responses'
require 'smartcore/router'
require 'smartcore/requests'
require 'smartcore/client'


module Smartcore

  def self.domain
    'http://localhost:4000'
  end

  def self.uri
    return "#{domain}/api/v1/"
  end
end
