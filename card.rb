	class CardValidator
		CARD_TYPES = {
			:AMEX => {
				:start_with => ["34", "37"],
				:card_number_length => [15]
			},
			:Discover => {
				:start_with => ["6011"],
				:card_number_length => [16]
			},
			:MasterCard => {
				:start_with => (51..55).to_a.map(&:to_s),
				:card_number_length => [16]
			},
			:VISA => {
				:start_with => ["4"],
				:card_number_length => [13, 16]
			}
	}

	def verify_luhn(card_number)
		card_number.chars.map(&:to_i).reverse.each_with_index.map { |x, idx| (idx % 2 == 0) ? x : x * 2  }.join("").chars.map(&:to_i).inject(0, :+) % 10 == 0
	end


	def check_start_and_length(card_number)
		card_type = ""
		CARD_TYPES.each do |c_type, value|
			valid = (card_number.start_with? *value[:start_with] and value[:card_number_length].include?(card_number.length))
			if valid
				card_type = c_type
			end
		end
		card_type
	end
end

class Card < CardValidator
	attr_accessor :card_number, :card_type

	def check_card_type
		check_start_and_length(self.card_number)
	end
end

card = Card.new

puts "Please enter the card number:"

while line = STDIN.gets
	break if line.chomp == "quit"
	card.card_number = line.strip
	card.card_type = card.check_card_type

	if card.card_type && card.verify_luhn(card.card_number)
		puts card.card_type.to_s + ": " + card.card_number.delete(" ") + " (valid)"
	else
		msg = card.card_type.empty? ?  "Unknown" : card.card_type.to_s
		puts  msg + ": " + card.card_number + " (invalid)"
	end
	puts "Please enter next card number or type 'quit' :"
end

