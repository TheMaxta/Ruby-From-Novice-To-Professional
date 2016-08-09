
n = gets.chomp.to_i
# N is our number of operations

## big o(n):
for i in 1..n do
	puts "Hi : #{i}"
end

## big o(n^2):
for i in 1..n do 
	for j in 1..n do
		puts "Hi, exponentials : #{i} Second Loop : #{j}"
	end
end
#big o(n^3):
for i in 1..n do
	for j in 1..n do
		for e in 1..n do 
			puts i;
		end
	end
end

#big o(log n)