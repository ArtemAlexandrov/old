require 'bundler/setup'
Bundler.setup

require 'smartcore'
require 'faker'


def generate_email
  "#{random_string(16)}@#{random_string(10)}.#{random_string(3)}"
end
def random_string(lenght)
  (0...lenght).map { (65 + rand(26)).chr }.join
end

RSpec.configure do |config|
  # some (optional) config here
end