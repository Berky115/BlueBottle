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
    
    def get_total_customer_subscriptions(customer, status)
      return @store[:subscriptions].count{|subscriber|subscriber.customer == customer and subscriber.status == status}
    end

    def get_total_coffee_subscriptions(coffee, status)
      return @store[:subscriptions].count{|subscriber|subscriber.coffee == coffee and subscriber.status == status}
    end

  end
end
