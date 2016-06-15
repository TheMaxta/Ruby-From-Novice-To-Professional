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




# text summary ------------------------

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)						# splits string into sentences
sentences_sorted = sentences.sort_by { |sentence| sentence.length }			# sorts sentences by their chracter length
one_third = sentences_sorted.length / 3										# divide their lengths by 3 --
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)			# --to delete super short sentences, and super long sentences
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts ideal_sentences.join(". ")



# text summary ------------------------




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
percent =  stop_count.to_f / total_words.to_f

percent = (percent * 100).to_i
puts "#{percent}% of the words were completely unnecessary. Thanks."





