require 'active_support/all'

module BlueBottle
  module Models
    class Coffee
      attr_accessor :id,
                    :name,
                    :type,
                    :subscriptions

      VALID_TYPES = ['blend','single_origin']

      def initialize(id, name, type)
        @id = id
        @name = name
        @type = type
        @subscriptions = Array.new
        validate_type
      end

      def subscriptions
        @subscriptions
      end

      private

      def validate_type
        raise "'#{type}' is not a valid type of coffee. Valid types are #{VALID_TYPES.join(', ')}." unless VALID_TYPES.include?(type)
      end

    end
  end
end
