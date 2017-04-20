module Smartcore
class WhereCondition

  include Virtus.model

  AVAILABLE_MATCHERS = %w(equal greater_than less_than like custom)

  attribute :field,         String
  attribute :matcher,       String
  attribute :value,         String

end
end