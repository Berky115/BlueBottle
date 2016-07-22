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
      #this block remedied with hash/ assumption of not maintaining cancelled subscriptions. See coding_questions
      for subscription in @data_store.subscriptions
        if subscription.customer == customer and subscription.coffee ==coffee 
         subscription.status = status
        end
      end
    end

    def cancel_subscription(customer, coffee)
      for subscription in @data_store.subscriptions
        if subscription.customer == customer and subscription.coffee == coffee 
          if subscription.status == PAUSED
           raise 'Failed to cancel subscription. Subscription is paused' 
          else
            subscription.status = CANCELLED
          end
       end
      end 
    end

   end
  end
end
