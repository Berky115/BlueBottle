module BlueBottle
  class CodingQuestion
  	#The code here is reflective of the spec/tests provided for me. As such I have designed around the rules they enforce.
  	#A few questions came to me as I developed, they are listed below.
  	#
  	# Why are we maintaining customer subscriptions on both customer and subscription? 
  	#
  	#The tests are written in a way that 
  	# Requre both house responsibility for tracking. I would argue that this is not necessary and that customer name and status
  	# Could be maintained in a hash on the subscriptions themselves. 
  	#
  	# Why are we maintaining a record for cancelled as well as active?
  	#
  	# The tests at the end dictate that a record be maintained for a user that has cancelleda subscription. I don't understand
  	# A reason for this decision. It means the records of status do not get removed by design, which would lead to problems 
  	# if the subscription service/DB this later stores to was put to long term use.
  	#
  	#
  	#
  end
end
