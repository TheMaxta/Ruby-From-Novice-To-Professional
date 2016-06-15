text = %q{
	Ruby is a great programming language. It is object oriented
	 and has many groovy features. Some people don't like it, but that's
	 not our problem! It's easy to learn. It's great. To learn more about Ruby,
	 visit the official Ruby Web site today.
}

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)						# splits string into sentences
sentences_sorted = sentences.sort_by { |sentence| sentence.length }			# sorts sentences by their chracter length
one_third = sentences_sorted.length / 3										# divide their lengths by 3 --
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)			# --to delete super short sentences, and super long sentences
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts ideal_sentences.join(". ")

