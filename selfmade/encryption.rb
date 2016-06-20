##### Program receives an argv over a txt rile. #####
=begin

	1) Creates a summary of important sentences
	2) delivers string specific info like words and sentences
	3) scans for filler / stop words. 
	4) displays all this information to user

=end	


lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join



text = "abcdefg Im max"



text = text.gsub(/\s/, '')



encrypted_text = text.split("")


# encryption key
#val = rand(1..20)
val = 1


encrypted_text = encrypted_text.map do |e|	

	e.ord

end

## wrap lowercase and capital ascII characters back to a, A
encrypted_text = encrypted_text.map do |x|


	## selects lowercase letters
	if ((x >= 97) && (x <= 122))


		## works for positive val's
		if (x + val) >= 123
							# we use just x -123 to calc. (not x + val) - 123. I feel it works better this way.
			temp = x - 123	#temp var to store the difference before wrapping to a

			x = 97 + temp	## use the difference to calculate the remaining movement

		## works for negative val's
		elsif (x + val) <= 96
			
			temp = x - 96 ## get difference

			x = 123 + temp 


		else	
			x = x
		end #end if

	## selects uppercase letters
	elsif ((x >= 65 ) && (x <= 90))

		## works for positive val's
		if (x + val) >= 91
			temp = x - 91
			x = 65 + temp


		## works for negative val's
		elsif (x + val) <= 64
			temp = x - 64
			x = 91 + temp


					
		else
			x = x
		end
	else 
		x = x	
	end


end #end loop



## Now we change all values back to characters.
encrypted_text = encrypted_text.map do |e|	

	(e.ord + val).chr

end

encrypted_text = encrypted_text.join("")

print encrypted_text

puts val
