module Smartcore
class WhereCondition < Condition

  AVAILABLE_MATCHERS = %w(equal greater_than less_than like custom)

  attribute :value,    String

end
end