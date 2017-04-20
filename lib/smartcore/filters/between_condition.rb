module Smartcore
  class BetweenCondition

    include Virtus.model

    AVAILABLE_MATCHERS = %w(between)

    attribute :field,         String
    attribute :matcher,       String, default: AVAILABLE_MATCHERS[0]
    attribute :value,         Hash


    AVAILABLE_MATCHERS.each do |available_matcher|
      define_method :"#{available_matcher}_matcher!" do
        self.matcher = available_matcher
      end
    end

    private

    def matcher=(value)
      super(value)
    end

  end
end