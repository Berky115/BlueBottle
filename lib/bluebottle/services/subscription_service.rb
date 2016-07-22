module BlueBottle
  module Services
    class SubscriptionService

    def initialize(data_store)
      @data_store = data_store
    end
      
    def active_subscription(customer, subscription)
        update_status(customer, subscription, ACTIVE)
        subscription.customers.push(customer)
    end

    def update_status(customer,subscription, status) 
      customer.subscriptions[subscription] = status
    end

    def cancel_subscription(customer, subscription)
      if customer.subscriptions[subscription] == PAUSED
        raise 'Failed to cancel subscription. Subscription is paused'  
      else  
        update_status(customer, subscription, CANCELLED)
      end
    end 
    
    end
  end
end
