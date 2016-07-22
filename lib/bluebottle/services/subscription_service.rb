module BlueBottle
  module Services
    class SubscriptionService

    def initialize(data_store)
      @data_store = data_store
    end
      
    def create_subscription(customer, coffee, status)
        update_customer_subscription_status(customer, coffee, status)
        coffee.subscriptions.push(BlueBottle::Models::Subscription.new(customer, coffee, status))
    end

    def update_customer_subscription_status(customer, subscription, status) 
      customer.subscriptions[subscription] = status
    end

    def cancel_subscription(customer, coffee)
      if customer.subscriptions[coffee] == PAUSED
        raise 'Failed to cancel subscription. Subscription is paused'  
      else  
        update_customer_subscription_status(customer, coffee, CANCELLED)
        coffee.subscriptions.delete_if {|i|i.customer == customer }
        coffee.subscriptions.push(BlueBottle::Models::Subscription.new(customer, coffee, CANCELLED))
      end
    end 
    
    end
  end
end
