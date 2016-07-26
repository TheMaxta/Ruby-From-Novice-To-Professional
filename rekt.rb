# Program prints a rectangle out of an inputted string. specify height and width



def rekme(word, width, height)

	#break down into characters

	word.upcase!


	reversed = word.reverse

	r_chars  = reversed.split("")

	chars    = word.split("")

	h_chars   = chars.join(" ").split("")
	h_r_chars = r_chars.join(" ").split("")

	length   = word.length
	h_length = h_chars.length



	if (width == 1 && height == 1)
		print_top(h_chars, h_length)

		puts 

		print_middle(chars, r_chars, length)
		print_bottom(h_r_chars, h_length)


	elsif (width > 1 && height > 1)

				mid_chars = get_mid_chars(h_chars)

				height.times do |x|
					if x % 2 == 0
						print_horizontal(width, h_chars, h_length, mid_chars) #normal
						print_middle_test(chars, r_chars, width)

					else 
						print_horizontal(width, h_r_chars, h_length, mid_chars.reverse) ##reversed
						print_middle_test(r_chars, chars, width)

					end
				end
				print_horizontal(width, h_chars, h_length, mid_chars)



	elsif (width  > 1)
		mid_chars = get_mid_chars(h_chars)
		(width).times do |x|
			if    (x == 0)
				print_top(h_chars, h_length)
			elsif (x % 2 == 0)
				print mid_chars
				print h_chars[h_length-1]
			else  #odd
				print mid_chars.reverse
				print h_chars[0]
			end
		end	

		puts

		print_middle_test(chars, r_chars, width)


		(width).times do |x|
			if x == 0
				print_bottom(h_r_chars, h_length)
			elsif (x % 2 == 0)
				print mid_chars.reverse
				print h_chars[0]
			else
				print mid_chars
				print h_chars[h_length-1]
			end
		end	


	elsif (height > 1)






	else
		puts "No Known Valid Output Method."
	end


	puts "\n\n\n"


end

def print_middle(chars, r_chars, length)
	h_chars = chars.join(" ").split("")
	distance = get_mid_chars(h_chars).length
	length.times do |x|
		if (x == 0)
		elsif (x == length-1)
		else
			print chars[x] + " " * distance + r_chars[x] + "\n"
		end
	end

end


def print_middle_test(chars, r_chars, width)
	h_chars     = chars.join(" ").split("")
	mid_chars   = get_mid_chars(h_chars)
	r_mid_chars = mid_chars.reverse
	distance    = mid_chars.length
	distance.times do |x|
		if (x % 2 == 0)
		else
			(width+1).times do |y|
				if y % 2 == 0
					print mid_chars[x]
					print " "*distance
				else
					print r_mid_chars[x]
					print " "*distance

				end

			end

			print "\n"
		end
	end

end
def get_mid_chars(chars)

	midChars = chars.drop(1)
	midChars.reverse!
	midChars = midChars.drop(1)
	midChars.reverse!
	midChars = midChars.join

	return midChars
end

def print_top(chars, length)
	length.times do |i|
		print "#{chars[i]}"
	end
end


def print_bottom(r_chars, length)
	length.times do |i|
		print "#{r_chars[i]}"
	end
end



def print_horizontal(width, h_chars, h_length, mid_chars)

	(width).times do |x|
		if    (x == 0)
			print_top(h_chars, h_length)
		elsif (x % 2 == 0)
			print mid_chars
			print h_chars[h_length-1]
		else  #odd
			print mid_chars.reverse
			print h_chars[0]
		end
	end	
	puts "\n"
end





rekme("rekt", 1, 1)
rekme("mahlke", 1, 1)
rekme("hello",5,1)

loop do
	puts "enter string: "
	s=gets.chomp
	puts "enter width :  "
	w=gets.chomp.to_i
	puts "enter height:  "
	h=gets.chomp.to_i
	rekme(s,w,h)

end