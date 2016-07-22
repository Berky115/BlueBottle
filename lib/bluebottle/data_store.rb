module BlueBottle

  class DataStore
    def initialize
      @store = {
        customers: [],
        coffees: [],
        subscriptions: []
      }
    end

    def customers
       @store[:customers]
    end

     def coffees
        @store[:coffees]
    end

    def subscriptions
        @store[:subscriptions]
    end

    def add_coffee(coffee)
      @store[:coffees] << coffee
    end

    def add_customer(customer)
      @store[:customers] << customer
    end

    def add_subscription_type(subscription)
      @store[:subscriptions] << subscription
    end
 
  end
end
