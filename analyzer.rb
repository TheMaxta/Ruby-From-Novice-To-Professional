lines = File.readlines('text.txt')
line_count = lines.size
text = lines.join

puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"

total_words = text.split(' ').length
puts "#{total_words} total words"

sentence_count = text.split(/\.|\?|\!/).length
puts "#{sentence_count} sentences"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

puts "#{total_words / sentence_count} words per sentence. (Average)."
puts "#{sentence_count / paragraph_count} sentences per paragraph. (Average)."

=begin 
ADDING EXTRA FEATURES!!
=end

stopwords = %w{the your a by on for of are with just but and to the my I has some in you To when}		# the %w is just a quick ruby way of makin array
stop_count = 0
important_count = 0
words = text.scan(/\w+/)

keywords = words.select do |word|
	
	if stopwords.include?(word)
		stop_count += 1
	else
		important_count += 1
	end
end
puts "#{important_count} useful words"
puts "#{stop_count} stop words"


