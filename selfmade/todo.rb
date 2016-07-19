=begin

Program Manages a To Do list for me...
1). checks for file existence.
2). Opens file.
3). receives a string from user via console
4). appends that string to ToDo.txt file
5). User can remove items upon completion.
6). User can add progress information to a list item.



=end



class MyFile
	attr_reader :handle

	def initialize(filename)
		if File.exist?(filename)
			@handle = File.new(filename, 'r+')
		else
			puts "\n\n You haven't made your todo.txt file yet. "
			return false
		end
	end

	def welcome
		puts "\n\n\n\nHello! Welcome to your To Do list!!"
		puts "It's time for you to get some work done, son."
		puts "--------------------------------------------------------"
		puts "\n\nType the corresponding number to select an option."
		puts "1). Add an item."
		puts "2). Finished an item."
		puts "3). Progress on something."
		puts "4). Show List."
		puts "5). Set Program Reminders."
		puts "9)  Save changes, and exit program."
		puts "\n\n\n"

		response = gets.chomp
		response = response.to_i
		if response == 1
			add_item
		elsif response == 2
			puts "blah blah blah finish item"
		elsif response == 4
			display_list
				
		elsif response == 9
			exit
		else
			puts "\n\n\n"
			puts "Non-valid command."
			puts "Please try again."
			puts
			puts
			sleep(2.0) # Wait two seconds...
			puts "\n\n\n\n\n"
			welcome
		end
			

	end


	def user_input
		puts
		puts "Please type The Job you need to finish.\n\n"
		@user_string = gets.chomp

	end

	def add_item
		user_input
		find_end								#first locate the end of the file
		format_string							#add formatting to users string
		@handle.puts @user_string				#then, append that string to file
		display_list
		puts "\n\nNew Items:"
		puts "----------------------------"
		puts @user_string
		puts "\n----------------------------"
		sleep(3.0)
		welcome
	end



	def find_end
		@handle.seek(-1, IO::SEEK_END)
	end



	def format_string
		find_list_number
		@user_string = @user_string.capitalize
		@user_string.prepend("\n#{@num_of_items}).  ") # we want to prepend 1).  list item one...
		@user_string += ('.')
		@user_string += "        date added: #{Time.now.strftime('%v')}"
	end

	def display_list
		File.open('ToDo.txt', 'r').each do | line |

			puts line

		end

	end

	def find_list_number
		@lines = []

		File.open('ToDo.txt', 'r').each do |line|

			@lines << line

		end

		@num_of_items = @lines.length		# -1 to account for title line

	end


	def finished
		@handle.close
	end

end


class Reminder
	#attr_accessor 

	def initialize(name)
	end

	def set_interval

	end

	def run_in_background

	end

end

f = MyFile.new('ToDo.txt')

puts f
puts File.expand_path('ToDo.txt')
f.welcome
f.finished
