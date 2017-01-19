require 'virtus'
require 'rails'

require 'smartcore/version'
require 'smartcore/errors'
require 'smartcore/models'
require 'smartcore/responses'
require 'smartcore/requests'
require 'smartcore/client'


module Smartcore
  def self.uri
    return 'http://localhost:4000/api/v1/'
  end
end
