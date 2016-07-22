module BlueBottle
  module Services
    class SubscriptionService

      def initialize(data_store)
        @data_store = data_store
      end
      

    def add_subscription_to_customer(customer, subscription, status)
        customer.subscriptions[subscription] = status
        subscription.customers.push(customer)
    end

    def update_status(customer,subscription,status) 
      customer.subscriptions[subscription] = status
   end

    def cancel_subscription(customer,subscription)
      if customer.subscriptions[subscription] == "pause"
        raise 'Failed to cancel subscription. Subscription is paused'  
      else  
      customer.subscriptions[subscription] = "cancelled"
      end
    end 
    

    end
  end
end
