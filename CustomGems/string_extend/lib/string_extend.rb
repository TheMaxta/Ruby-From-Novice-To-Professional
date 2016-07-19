# require 'rubygems'

class String
	def vowels
		p scan(/[aeiou]/i) #regex to scan for vowels
	end

	def find_periods
		p scan(/[.]/i) # find all periods
	end

	def count_words
		p split.length
	end
end


=begin
puts "Hello, World. How are you today?"
puts "\n\n"
"Hello, World. How are you today?".vowels
puts "\n\n"
"Hello, World. How are you today?".find_periods
puts "\n\n"
"Hello, World. How are you today?".count_words
=end