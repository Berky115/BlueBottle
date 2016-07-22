require 'bluebottle'
require 'bluebottle/coding_question'

describe BlueBottle::CodingQuestion do
  let(:sally) { BlueBottle::Models::Customer.new(1, 'Sally', 'Fields', 'sally@movies.com') }
  let(:jack) { BlueBottle::Models::Customer.new(2, 'Jack', 'Nickleson', 'jack@movies.com') }
  let(:liv) { BlueBottle::Models::Customer.new(3, 'Liv', 'Tyler', 'liv@movies.com') }
  let(:elijah) { BlueBottle::Models::Customer.new(4, 'Elijah', 'Wood', 'elijah@movies.com') }

  let(:bella_donovan) { BlueBottle::Models::Coffee.new(1, 'Bella Donovan', 'blend') }
  let(:giant_steps) { BlueBottle::Models::Coffee.new(2, 'Giant Steps', 'blend') }
  let(:hayes_valley_espresso) { BlueBottle::Models::Coffee.new(3, 'Hayes Valley Espresso', 'blend') }

  let(:bella_subscription) { BlueBottle::Models::Subscription.new(bella_donovan)}
  let(:giant_subscription) { BlueBottle::Models::Subscription.new(giant_steps)}
  let(:hayes_valley_subscription) { BlueBottle::Models::Subscription.new(hayes_valley_espresso)}  

  let(:store) { BlueBottle::DataStore.new }
  let(:subscription_service) { BlueBottle::Services::SubscriptionService.new(store) }

  before do
    store.add_customer(sally)
    store.add_customer(jack)
    store.add_customer(liv)
    store.add_customer(elijah)

    store.add_coffee(bella_donovan)
    store.add_coffee(giant_steps)
    store.add_coffee(hayes_valley_espresso)

    store.add_subscription_type(bella_subscription)
    store.add_subscription_type(giant_subscription)
    store.add_subscription_type(hayes_valley_subscription)
  end

  context 'Sally subscribes to Bella Donovan' do
    before do
      subscription_service.create_subscription(sally, bella_subscription, ACTIVE)
    end

    it 'Sally should have one active subscription' do
      expect(sally.subscriptions.has_key? bella_subscription).to eq(true)
    end

    it 'Bella Donovan should have one customer subscribed to it' do
      expect(bella_subscription.customers).to include(sally)
    end
  end

  context 'Liv and Elijah subscribe to Hayes Valley Espresso' do
    before do
      subscription_service.create_subscription(liv,hayes_valley_subscription, ACTIVE)
      subscription_service.create_subscription(elijah,hayes_valley_subscription, ACTIVE)
    end

    it 'Liv should have one active subscription' do
      expect(liv.subscriptions).to include(hayes_valley_subscription)
    end

    it 'Elijah should have one active subscription' do
      expect(elijah.subscriptions).to include(hayes_valley_subscription)
    end

    it 'Hayes Valley Espresso should have two customers subscribed to it' do
      expect(hayes_valley_subscription.customers.size).to eq(2)
    end
  end

  context 'Pausing:' do
    context 'when Liv pauses her subscription to Bella Donovan,' do
      before do
       subscription_service.create_subscription(liv,bella_subscription, ACTIVE)
       subscription_service.update_subscription_status(liv,bella_subscription,PAUSED)
      end
      it 'Liv should have zero active subscriptions' do
        expect(liv.subscriptions.values.count("active")).to eq(0)
      end

      it 'Liv should have a paused subscription' do
        expect(liv.subscriptions.values.count(PAUSED)).to eq(1)
      end

      it 'Bella Donovan should have one customers subscribed to it' do
        expect(bella_subscription.customers.size).to eq(1)
      end
    end
  end

  context 'Cancelling:' do
    context 'when Jack cancels his subscription to Bella Donovan,' do
      before do
        subscription_service.create_subscription(jack,bella_subscription, ACTIVE)
        subscription_service.cancel_subscription(jack,bella_subscription)
      end

      it 'Jack should have zero active subscriptions' do
        expect(liv.subscriptions.values.count(ACTIVE)).to eq(0)
      end

      it 'Bella Donovan should have zero active customers subscribed to it' do
        expect(bella_subscription.customers.count(ACTIVE)).to eq(0)
      end

      context 'when Jack resubscribes to Bella Donovan' do
        before do
          subscription_service.create_subscription(jack,bella_subscription,ACTIVE)
        end
        it 'Bella Donovan has two subscriptions, one active, one cancelled' do
          expect(bella_subscription.customers.size).to eq(2)
        end
      end
    end
  end

  context 'Cancelling while Paused:' do
    context 'when Jack tries to cancel his paused subscription to Bella Donovan,' do
      before do
        subscription_service.create_subscription(jack,bella_subscription, PAUSED)
      end

      it 'Jack raises an exception preventing him from cancelling a paused subscription' do
        expect{store.cancel_subscription(jack,bella_subscription)}.to raise_exception
      end
    end
  end
end
