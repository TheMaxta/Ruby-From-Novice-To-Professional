# Program prints a rectangle out of a string. specify height and width	

def word_box(word, width, height)
	#break down into characters
	#h_char and h_length are for horizontal characters. they contain extra spacing.
	word.upcase!
	reversed  = word.reverse
	r_chars   = reversed.split("")
	chars     = word.split("")
	h_chars   = chars.join(" ").split("")
	h_r_chars = r_chars.join(" ").split("")
	length     = word.length
	h_length   = h_chars.length

	mid_chars = get_mid_chars(h_chars) #characters between first and last letter

	if (width >= 1 && height >= 1)
			height.times do |x|
				if x % 2 == 0
					print_horizontal(width, h_chars, mid_chars) #normal
					print_middle(chars, r_chars, width)
				else 
					print_horizontal(width, h_r_chars, mid_chars.reverse) ##reversed
					print_middle(r_chars, chars, width)
				end
			end
			print_horizontal(width, h_chars, mid_chars) if (height % 2 == 0)
			print_horizontal(width, h_r_chars, mid_chars.reverse) if (height % 2 == 1)
	else
		puts "No Known Valid Output Method."
	end
	puts "\n\n\n"
end

def print_middle(chars, r_chars, width)
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

def print_horizontal(width, h_chars, mid_chars)
	h_length = h_chars.length
	(width).times do |x|
		if (x == 0)
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

loop do
	puts "enter string: "
	s=gets.chomp
	puts "enter width :  "
	w=gets.chomp.to_i
	puts "enter height:  "
	h=gets.chomp.to_i
	word_box(s,w,h)
end