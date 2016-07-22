require 'active_support/all'

module BlueBottle
  module Models
    class Subscription
      attr_accessor :coffee,
                    :customers

      def initialize(coffee)
      	@coffee = coffee
        @customers = Array.new
      end

      def coffee
        @coffee
      end

      def customers
        @customers
      end

      def add_subscriber(customer, status) 
      	@customers[customer] = status
      end

    end
  end
end
