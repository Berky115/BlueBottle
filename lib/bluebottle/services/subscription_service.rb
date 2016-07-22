module BlueBottle
  module Services
    class SubscriptionService

    def initialize(data_store)
      @data_store = data_store
    end
      
    def create_subscription(customer, coffee, status)
      @data_store.subscriptions.push(BlueBottle::Models::Subscription.new(customer, coffee, status))
    end

    def update_customer_subscription_status(customer, coffee, status) 
      @data_store.subscriptions.detect {|subscription| subscription.customer == customer and subscription.coffee == coffee }.status = status
    end

    def cancel_subscription(customer, coffee)
      if @data_store.subscriptions.detect {|subscription| subscription.customer == customer and subscription.coffee == coffee }.status == PAUSED
        raise 'Failed to cancel subscription. Subscription is paused' 
      else
        update_customer_subscription_status(customer, coffee, CANCELLED)
      end
    end

   end
  end
end
