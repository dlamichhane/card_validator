How to run?
==========

 - In the ruby console require 'card.rb'
 - And put the credit card number for the AMEX, VISA, MasterCard,Discover
 - Sample codes

	```ruby
	VISA: 4111111111111111       (valid)
	VISA: 4111111111111          (invalid)
	VISA: 4012888888881881       (valid)
	AMEX: 378282246310005        (valid)
	Discover: 6011111111111117   (valid)
	MasterCard: 5105105105105100 (valid)
	MasterCard: 5105105105105106 (invalid)
	Unknown: 9111111111111111    (invalid)
	```