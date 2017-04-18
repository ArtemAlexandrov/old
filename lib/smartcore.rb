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
    'https://smartcore.ggdigital.com/api/v1'
  end

  def self.domain
    if Rails.env.development?
      'http://localhost:3000/api/v1'
    else
      'http://10.20.57.110:433/api/v1'
    end
  end

  def public_uri
    "#{public_domain}/api/v1/"
  end

  def self.uri
    "#{domain}"
  end
end
