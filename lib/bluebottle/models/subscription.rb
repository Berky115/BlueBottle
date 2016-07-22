require 'active_support/all'

module BlueBottle
  module Models
    class Subscription
      attr_accessor :coffee,
                    :customer,
                    :status

      def initialize(customer, coffee, status)
      	@coffee = coffee
        @customer = customer
        @status = status
      end

      def coffee
        @coffee
      end

      def customer
        @customer
      end

       def status
        @status
      end

    end
  end
end
