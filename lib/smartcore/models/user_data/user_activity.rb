module Smartcore
  module Models
    class UserActivity < BaseModel

      attribute :type, String
      attribute :data, String
      attribute :created_at, DateTime
      attribute :profile_id, String

    end
  end
end
