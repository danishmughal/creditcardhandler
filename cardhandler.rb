require_relative 'card'

input = File.open("input.txt", "r")

cards = {}
output_array = []

input.readlines.each do |line|

	# Splits the words of the line into an array
	words = line.split

	# Stores the words into different variables for ease of use
	card_command = words[0]
	card_name = words[1]
	card_number = words[2]

	card = cards[card_name]

	# Add Command
	if (card_command == "Add")

		# Checks to see if the card with that name already exists
		if card
			puts "Error! #{line}: That name already exists. \n\n"
		else 
			card = cards[card_name] = Card.new(card_name, card_number, words[3].gsub('$','').to_i, 0)
			# Performs Luhn10 check on the card number
			if check_luhn(card.number) == false
				# If card doesn't pass Luhn10 ,error displayed
				card.error = true
				puts "Error! #{line}: Card number is invalid - doesn't pass Luhn10 test. \n\n"
			end
		end

	# Charge Command
	elsif (card_command == "Charge")
		# Make sure that a card with that name exists
		if card && card.error != true

			# Calculate what the balance would be if the charge was applied
			chargeresult = card.balance + words[2].gsub('$','').to_i

			# Check whether chargeresult would exceed the limit on the card
			if chargeresult < card.limit

				# If chargeresult doesn't exceed the limit, the new balance is saved
				card.balance = chargeresult
			else 
				puts "Error! #{line}: Charge amount exceeds limit on the card. \n\n"
			end
		end

	# Credit command
	elsif (card_command == "Credit")

		# Make sure card with that name exists and credits that card
		if card && card.error != true
			card.balance -= card_number.gsub('$', '').to_i
		else
			puts "Error! #{line}: That card does not exist. \n\n"
		end

	else 
		puts "Error! #{line}: Invalid input command. \n\n"
	end
end



# Displaying the summary
puts "Summary: "
cards.sort.each do |k, v|
	if v.error == true
		puts "#{k}: error"
	else
		puts "#{k}: $#{v.balance}"
	end
end