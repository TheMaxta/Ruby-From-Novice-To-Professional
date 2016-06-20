puts "Welcome, User!"
puts "Type 1 to login."
puts "Type 2 to register."

ans1 = gets

ans1 = ans1.to_i


match = 0
if ans1 == 1
	puts "User Name:"
	user = gets
	## check for username
	f = File.new("accounts.txt","r").each(',') do |d|

		puts d

		if d == "themaxta,"
			 puts "Success!!!" 
			 match = 1										## correct, authentication match!!
		end

	end


	if match == 1
		puts "Welcome back, #{user}"


	else
		puts "Incorrect! Please try again."
	end	


elsif ans1 == 2
	puts "Please provide an email:"
	puts "Enter a username"
	puts "Enter a password"


else
	puts "Incorrect input. Try again."
end

puts ans1
