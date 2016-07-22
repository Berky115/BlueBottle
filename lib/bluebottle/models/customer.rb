require 'active_support/all'

module BlueBottle
  module Models
    class Customer
      attr_accessor :id,
                    :first_name,
                    :last_name,
                    :email,
                    :subscribers

      def initialize(id, first_name, last_name, email)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @email = email
        @subscribers = Hash.new
      end

      def subscriptions
        @subscribers
      end

      def full_name
        "#{first_name} #{last_name}"
      end
    end
  end
end
