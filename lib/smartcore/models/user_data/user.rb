require 'active_model'

module Smartcore
  module Models
    class User < BaseModel
      extend ::ActiveModel::Naming
      include Smartcore::UserData
      def initialize(*options)
        super(*options)
        @errors = ActiveModel::Errors.new(self)
      end

      def printable_name
        "#{first_name} #{last_name}"
      end

      attr_reader :errors

      def init_errors_by_json(json)
        json.each do |error_key, error_messages|
          error_messages.each do |message|
            errors.add error_key, message
          end
        end
      end
      # The following methods are needed to be minimally implemented

      def valid?
        @errors.empty?
      end

      def read_attribute_for_validation(attr)
        send(attr)
      end

      def self.human_attribute_name(attr, options = {})
        attr
      end

      def self.lookup_ancestors
        [self]
      end
    end
  end
end
