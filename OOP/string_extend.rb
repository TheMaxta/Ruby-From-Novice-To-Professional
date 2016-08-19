# require 'rubygems'

class String
	def vowels
		scan(/[aeiou]/i) #regex to scan for vowels
	end

end

p "this is a test".vowels

#you could use this file in a library of an application, and load it in with require_relative.