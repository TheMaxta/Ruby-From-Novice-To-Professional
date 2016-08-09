## Given N distinct integers, how many triples sum to exctly zero?
require 'benchmark'


#pass an array as an argument, method checks for sum of array equating to 0...
def checkArray(a)
	n = a.length-1
	count = 0
	for i in 0..n do
		for j in (i+1)..n do
			for k in (j+1)..n do
				if (a[i] + a[j] + a[k] == 0)
					count += 1
					puts "EQUALS ZERO ==========="
					return count;
				else
					puts "DOESN'T EQUAL ZERO ===="
					return count;
				end
			end
		end
	end
end

## USER-BASED CLIENT INTERACTION

=begin
count = 0
puts "ENTER TO BEGIN / END TO QUIT:"
while input = gets and input != 'end'
	puts "First int?"
	a[0] = gets.chomp.to_i

	puts "Second int?"
	a[1] = gets.chomp.to_i

	puts "Third int?"
	a[2] = gets.chomp.to_i

	checkArray(a)
	sleep(1)
	puts "\n\n\n\nENTER TO REPEATE / END TO QUIT:"
end
=end



## ANALYTICAL CLIENT FOR TESTING N
a = []
count = 0
puts "How many numbers should we test??"
n = gets.chomp.to_i
n.times do
	a[0] = rand(-30..30)
	a[1] = rand(-30..30)
	a[2] = rand(-30..30)
	count += checkArray(a)
end



print count
puts
puts






