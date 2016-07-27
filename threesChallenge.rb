=begin
#threes game challenge
#Make a program, that plays the game of threes...
def divideByThree(n)
	newN = n / 3
	puts "#{n} / 3 = #{n/3}"


	return (newN)
end

def calculate(n)
	puts "N = #{n}"
	if n == 1
		puts "\n\n"
		puts "CONGRATS, YOU REACHED 1!"
		puts ""
	elsif (n-1) % 3 == 0
		puts "n - 1 = #{n-1}"
		puts "#{n-1} is divisible by three."
		n = divideByThree(n-1)
		puts "\n"

	elsif (n+1) % 3 == 0
		puts "n + 1 = #{n+1}"
		puts "#{n+1} is divisible by three."
		n = divideByThree(n+1)
		puts "\n"

	else 
		puts "n: #{n}"
		puts "already divisible by 3. n / 3 = #{n/3}"
		n = divideByThree(n)
		puts "\n"

	end
		
	return n


end


loop do 
	puts "\n\n\nType in a random number, and play the threes game!!!\n\n\n"
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
	puts "Reached 1, after #{counter} divisions by three."
end

=end
n = gets.to_i
(puts "#{n} #{1-(n+1)%3}"; n = (n+1)/3) while n > 1
p 1