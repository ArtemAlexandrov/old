require 'virtus'
require 'rails'

require 'smartcore/version'
require 'smartcore/errors'
require 'smartcore/models'
require 'smartcore/responses'
require 'smartcore/router'
require 'smartcore/requests'
require 'smartcore/client'
require 'smartcore/helper'


module Smartcore

  def self.public_domain
    'http://smartcore.ggdigital.com'
  end

  def self.domain
    'http://localhost:4000'
  end

  def public_uri
    "#{public_domain}/api/v1/"
  end

  def self.uri
    "#{domain}/api/v1/"
  end
end
