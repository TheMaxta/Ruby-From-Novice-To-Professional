class FancyTerminal

	def initialize(string)
		@string = string
		@stringArray = string.split(' ')
		@stringChars = string.scan(/./)
	end

	def display_vars
		puts @string
		puts @stringArray
		print @stringChars
		puts "\n\n"
	end

	def find_largest_word

		current_largest = ""

		@stringArray.each do |x|

			if x.length > current_largest.length #new largest found!
				current_largest = x #set new largest
			else
				#do nothing
			end 

		end #end loop

		return(current_largest)

	end #end method

	### LINE BY LINE OUTPUT METHODS

	def equal_spaced_output

		puts "Type an integer to set column spacing"
		spacing = gets.chomp.to_i
		largest_word = find_largest_word

		spacing += largest_word.length

		counter = 0
		@stringArray.each do |x|

			finished = nil			

			loop do 

				length = x.length


				if length <= spacing
					x << ' '
				else
					x << '|'
					break
				end


			end

			puts x

		end #end string each


	end #end method
	def simpleMenuSelection
		all_possible_buttons = @stringArray
		last_button = all_possible_buttons.length
		puts "  =============================================================================="
		puts "  Please select an option: "
		puts "  =============================================================================="
		puts "\n\n\n"


		counter = 0
		all_possible_buttons.each do |x|

			x.capitalize!
			x.prepend("(#{ counter += 1 }) -- ")
			x.prepend("                            ")
			x << "."



			puts x

		end
		puts "\n\n\n\n"
		puts "------------------------------------------------------------------------"
		puts "Please Choose A Number."
		puts "------------------------------------------------------------------------"
		get_response = gets.chomp.to_i

		return (get_response)
	end




	def set_security_levels(security_level, possible_buttons)
		chosen_permissions = []
		puts
		puts "======================================================="
		puts "Current Level: #{security_level}\n"
		puts "======================================================="

		puts "Right Now, we are setting #{security_level} Account Permissions."
		puts "#{security_level} accounts should be able to...."
		puts "\n\n\nESPONDING NUMBER"

		puts 

		output_simple(possible_buttons)
		puts "\n\n\n\n\n"
		user_response  =  gets.chomp.to_i

		## ADD USER'S SELECTED BUTTON TO BASIC'S ARRAY
		chosen_permissions << possible_buttons[user_response-1]

		puts "\n\n\n\n\n\n\n"
		puts chosen_permissions

			loop do 

				puts "\n\n\nGreat, now pick another!\n"

				output_simple(possible_buttons)
				puts ""
				puts "(exit) -- Done.\n\n\n\n\n"
				user_response  =  gets.chomp

				if user_response == 'exit'
					puts "\n\n\n\n\n\n"
					break
				else
					user_response = user_response.to_i
				end
				## ADD USER'S SELECTED BUTTON TO BASIC'S ARRAY
				chosen_permissions << possible_buttons[user_response-1]
				puts "\n\n\n\n\n\n\n\n"
				puts "Current Selection: "
				puts "-------------------------------------------------------"
				puts chosen_permissions
				puts "-------------------------------------------------------"

			end


		security_level_results = chosen_permissions

		return security_level_results
	end


	def advancedMenuSelection(possible_buttons, possible_permissions)
		security_level = "Basic-Users"
		basic_results = set_security_levels(security_level, possible_buttons)
		possible_buttons = possible_buttons - basic_results


		security_level = "Moderator Accounts"
		moderator_results = set_security_levels(security_level, possible_buttons)
		possible_buttons = possible_buttons - moderator_results


		security_level = "Admin Accounts"
		admin_results = set_security_levels(security_level, possible_buttons)
		possible_buttons = possible_buttons - admin_results


		secutiry_level = "Developer Accounts"
		developer_results = set_security_levels(security_level, possible_buttons)




		basic      = basic_results
		moderator  = basic + moderator_results
		admin      = moderator + admin_results
		developer  = admin + developer_results




		puts "BASIC ACCOUNTS NOW HANDLE: "
		puts basic 
		puts "\n\n\n"
		puts "MODERATOR ACCOUNTS NOW HANDLE "
		puts moderator
		puts "\n\n\n"

		puts "ADMIN ACCOUNTS NOW HANDLE "
		puts admin
		puts "\n\n\n"

		puts "DEVELOPER ACCOUNTS NOW HANDLE "
		puts developer
		puts "\n\n\n"
		puts "\n\n\n"

		puts "press enter to continue."
		gets.chomp


	end #method def


	#RETURNS STRING OF SPACES
	def ask_spacing

		puts "Type an integer to set column spacing"
		spacing = gets.chomp.to_i
		spacing_string = ""
		spacing.times do 
			spacing_string << " "
		end
		return (spacing_string)
	end


	def output_simple(array)

		puts "\n"

		i = 0
		loop do 
			puts "(#{i+1}) -- #{array[i]}."
				if array.length == i+1
					break
				end
			i += 1
		end #LOOP DO
		puts "\n"
	end

end #end fancy term object
test = FancyTerminal.new("hello world i like turtles lol haha beautiful supercalafragialistik")
#test.equal_spaced_output

test2 = FancyTerminal.new("start stop login signup logout settings play pause ")

#test2.ask_spacing
#test.display_vars
#test.equal_spaced_output
array1 = ["Create New Account", "Log In", "Log Out", "View Posts", "Write A Post", "Quit", "Settings", "Commands", "Find Profiles", "Set Permissions"]
array2 = %w[developer, admin, moderator, basic]
test2.advancedMenuSelection(array1, array2)
