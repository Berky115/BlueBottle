module BlueBottle
  class CodingQuestion
  	#The code here is reflective of the spec/tests provided for me. As such I have designed around the rules they enforce.
  	#A few questions came to me as I developed, they are listed below.
  	#
  	# Why are we maintaining customer subscriptions on both customer and subscription? 
  	#
  	# Why are we maintaining a record for cancelled as well as active?
  	#
  	# The tests at the end dictate that a record be maintained for a user that has cancelleda subscription. I don't understand
  	# A reason for this decision. It means the records of status do not get removed by design, which would lead to problems 
  	# if the subscription service/DB this later stores to was put to long term use.
  	#
  	# How often/ with what frequency is this service being used?
  	#
  	# Assumption of new customers / coffee types / Status ?
  	#
  	# I created the service with the assumption that new customers and coffee types would be added in the future. Meaning that
  	# a data structure that can be easily inserted to/modified would be ideal. It occures to me that if this was set with
  	# ONLY these customers/ coffee types / status then a different solution may be reachable.
  	#
  	#
  end
end
