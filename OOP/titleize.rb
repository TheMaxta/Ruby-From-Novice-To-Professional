
class String
	def titleize
		self.gsub(/(\A|\s)\w/){ |letter|  letter.upcase}

	end
end

puts "hi"