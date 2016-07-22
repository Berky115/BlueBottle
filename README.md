# BlueBottle
Blue Bottle Subscription Service:

The Blue Bottle subscription service allows a user to manage customer and coffee subscriptions of a Blue Bottle coffee store. The design decisions made in building this service came about with a test driven approach. Looking at a prescribed set of spec tests, iterating upon the design, and developing around functionality with app growth in mind.

subscription.rb:
Subscription’s final iteration treats a subscription as an object. Containing a customer, a coffee, and a status. A collection of these objects is then placed in a data_store, similar to the way other objects “coffee, customers” are tracked in a store. In this way, subscription mirrors that of a DB that would be written to in a later iteration of this service. This correctly places the responsibility of subscription storage on data_store.

Early iteration:
Initially, I wanted to treat subscription as a hash of values. This would allow quick tracking of object : status relations. As I wrote the application, I found that this approach had a few problems. Due to initial test descriptions, different relationships between a Customer and a coffee where required *see coding_question.rb*. Early subscriptions where set to house all subscribers for a coffee type. This resulted in multiple hashes, and redundant information shared between said collections. Another problem was the specs rule of maintaining a cancelled subscription along with a re-subscribed user. This meant the means of writing to a hash and overwriting it’s value would remove a subscription that needed to be maintained. Upon realizing this, I re-imagined my approach, and feel the service is more robust as a result. 

Note: Based on the tests provided descriptions, subscription records are not intended to be removed from the subscription collection. I believe this would be a problem if this service where put into long-term use.

subscription_Service.rb:
Subscription service is divided into three methods, covering the required behavior of adding subscription, updating a subscription status “pausing a subscription”, and canceling a subscription. 

status.rb:
Because status is treated as a flag and houses no data, constants have been created to handle the given status’s of “Active”, “Paused”, and “Cancelled”. If more status types are required, they can be added to status.rb quickly.

If you have questions, call outs to an alternative approach or would like to chat I can be reached at andrewfacchiano@gmail.com.     

Thank you, happy brewing!