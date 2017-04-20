module Smartcore
class WhereCondition

  include Virtus.model

  AVAILABLE_MATCHERS = %w(equal greater_than less_than like custom)

  attribute :field,         String
  attribute :matcher,       String, default: AVAILABLE_MATCHERS[0]
  attribute :value,         String


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