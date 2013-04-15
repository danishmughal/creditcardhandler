# Card class definition
class Card
	attr_accessor :name, :number, :limit, :balance, :error

	def name= name
		@name = name
	end

	def number= number
		@number = number
	end

	def limit= limit
		@limit = limit
	end

	def balance= balance
		@balance = balance
	end

	def error= error
		@error = error
	end

	def initialize (name, number, limit, balance)
		@name = name
		@number = number
		@limit = limit
		@balance = balance
	end


end



# Method to check whether a credit card number passes Luhn 10 check or not
def check_luhn(number)
	s1 = s2 = 0

	# Split number and place individual numbers into an array  
	num = (number).to_s.reverse.split('') 

	# Extract the odd/even indexed numbers from the reversed number
	odds = []
	evens = []
	num.each_slice(2) do |n|
		odds.push(n[0]) # Pushes odd indexed number into the odds array
		if n[1] then evens.push(n[1]) end # Pushes even indexed number into evens array
	end

	# Summing the odd digits
	odds.each do |o|
		s1 += o.to_i
	end

	# Double each integer
	evens.collect! do |e|
		e = e.to_i * 2
	end

	# Sum digits of each multiplication
	evens.collect! do |e|
		e = e.to_s.chars.map(&:to_i).reduce(:+)
		s2 += e
	end

	# Sum the odd/even sums
	sum = s1 + s2
	sum = sum.to_s.split('')

	# If the last digit of the sum is a 0, the credit card number passes Luhn algorithm
	# If not, it fails and the card number is invalid
	if (sum.last.to_i == 0)
		return true
	else 
		return false
	end

end
