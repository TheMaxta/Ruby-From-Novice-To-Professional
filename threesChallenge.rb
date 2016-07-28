#threes game challenge
#Make a program, that plays the game of threes...
def divideByThree(n)
	newN = n / 3
	puts "#{n} / 3 = #{n/3}"
	return (newN)
end
def calculate(n)
	if n == 1
	elsif (n-1) % 3 == 0
		print "#{n} -\n"
		n = divideByThree(n-1)
	elsif (n+1) % 3 == 0
		print "#{n} +\n"
		n = divideByThree(n+1)
	else 
		n = divideByThree(n)
	end
	return n
end

loop do 
	n = gets.chomp.to_i
	counter = 0
			loop do
				if n == 1
					counter+=1
					n = calculate(n)
					break
				else
					counter+=1
					n = calculate(n)
				end
			end
	puts "Finished after #{counter} divisions of three."
end