module BlueBottle
  module Services
    class SubscriptionService

    def initialize(data_store)
      @data_store = data_store
    end
      
    def create_subscription(customer, subscription, status)
        update_subscription_status(customer, subscription, status)
        subscription.customers.push(customer)
    end

    def update_subscription_status(customer,subscription, status) 
      customer.subscriptions[subscription] = status
    end

    def cancel_subscription(customer, subscription)
      if customer.subscriptions[subscription] == PAUSED
        raise 'Failed to cancel subscription. Subscription is paused'  
      else  
        update_subscription_status(customer, subscription, CANCELLED)
      end
    end 
    
    end
  end
end
