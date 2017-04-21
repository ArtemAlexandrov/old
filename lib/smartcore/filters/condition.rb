module Smartcore
  class Condition

    include Virtus.model

    AVAILABLE_MATCHERS = nil

    attribute     :field,   String
    attribute     :matcher, String
    attr_accessor :value

  end
end