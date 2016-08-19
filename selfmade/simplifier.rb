#SIMPLIFYING FRACTIONS! r/dailyprogrammer submissions :D

=begin
	1). Needs to receive numerator, and denominator as inputs.
	2). Finds Greatest Common Devisor of N and D	
	3). Divides N and D, and returns the result.
	
=end


class Simplifier


	def menu
		puts "What would you like to simplify today?? "
		puts "Respond w/ a number."
		puts "\n\n"
		puts "1). Simplify a Fraction"
		puts "2). Simplify an equation"
		puts "3). Simplify my text."
		puts "\n\n"

		answer = gets.chomp
		case answer
		when '1'
			n   = getNumerator
			d   = getDenominator
			gcd = findGCD( n , d )
			divideFraction( n , d , gcd)
		when '2'
		when '3'
		else
			puts "Input Doesn't match with any form of simplification, please try again..."
			waitTimer(3)
			self.menu
		end
	end

	def waitTimer(seconds)
		puts "\n\nLoading...................\n\n"
		loop do
			sleep(1)
			puts "restarting in: #{seconds}"
			seconds -= 1
				if seconds <= 0
					sleep(0.5)
					break;
				end
		end
	end

	def getNumerator

	end

	def getDenominator

	end

	def findGCD(numerator, denominator)

	end

	def divideFraction(numerator, denominator, greatestCommonDivisor)
		n   = numerator
		d   = denominator
		gcd = greatestCommonDivisor

		newN = n / gcd
		newD = d / gcd

		puts "\n\n\n\n"
		puts "---------------------------------"
		puts "new fraction: "
		puts "                 #{n}"
		puts "                -----"
		puts "                 #{d}"
		puts "\n\n"
		puts "---------------------------------"
	end

end



test1 = Simplifier.new()
test1.menu