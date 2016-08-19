class String
	def sentences
		gsub(/\n|\r/, ' ').split(/\.\s*/)
	end

	def words
		scan(/\w[\w\'\-]*/)
	end



	##nobreak replaces all linebreaks with space-chars
	def nobreak
		gsub(/\n|\r/, ' ')
	end
end


class WordPlay

	#Swaps pronouns to emulate a discussion/ question-answer
	def self.switch_pronouns(text)
		text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
			case pronoun.downcase
			when "i"
				"you"
			when "you"
				"me"
			when "me"
				"you"
			when "i am"
				"you are"
			when "you are"
				"i am"
			when "your"
				"my"
			when "my"
				"your"
			end #end of case
		end.sub(/^me\b/i, 'i') #end of do |pronoun|... This chained sub changed me to I for the first word in sentence only.
	end

	#selects sentence with most "desired words"(passed as an array)
	def self.best_sentence(sentences, desired_words)
		ranked_sentences = sentences.sort_by do |s|
			s.words.length - (s.downcase.words - desired_words).length
		end
		ranked_sentences.last
	end
end