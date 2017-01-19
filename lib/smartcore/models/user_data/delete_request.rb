module Smartcore
  module Models
    class DeleteRequest < BaseModel
      attribute :created_at, Date
      attribute :profile, Smartcore::Models::User
    end
  end
end
