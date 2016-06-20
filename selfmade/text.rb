
document = ''
lineC = 0
File.open('text.txt').each do |line|
	lineC += 1
	document << line

end

document = document.to_s


charC = document.length
puts "Character Count: #{charC}"

nospace = document.scan(/\w/).length
puts "No Space Character Count: #{nospace}"

puts "Line count: #{lineC}"

wordC = document.split(' ').length
puts "Word Count: #{wordC}"

sentenceC = document.scan(/\./).length
puts "Sentence Count: #{sentenceC}"

paragraphC = document.split(/\n\n/).length
puts "Paragraph Count: #{paragraphC}"

avg1 = wordC / sentenceC
puts "average number of words per sentence: #{avg1}"

avg2 = sentenceC / paragraphC
puts "average numver of sentences per paragraph: #{avg2}"

