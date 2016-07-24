require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true


	###TASKS

				# 1). possible object oriented structure(done) 
				# 2). dynamic find function(done)
				# 3). update people table with new information(done)
				# 5). users can post a forum(done)
		# 6). users can post comments(!INCOMPLETE!)
				# 7). searching for a username returns all similar users, not just one.(done)
				# 8). seperate console display funcionts


	### VISUALS AND SHELL DISPLAYS ### -- BELOW

=begin



	def display_all_posts


		list = $db.execute("SELECT * FROM posts")


		puts "\n\n\n\n"
		puts "Most Recent Posts: "
		puts "\n\n"
		unless list
			puts "No Posts Found."
			return
		end


		iteration = 1

		list.each do |x|
			puts "    #{iteration}.  |   Title:  #{x['subject']}   |   Author:  #{x['author']}   |    Karma:  #{x['karma']}   |\n\n"
			iteration += 1
		end


	end #end of method




	def scroll_display
		10.times do 
			puts "  --------      --------      --------      --------      --------      --------      --------\n"
			sleep(0.12)
		end #end loop
		puts "\n\n\n"

		sleep(0.12)

		puts "           W e l c o m e     T o     A c c o u n t     S i m u l a t o r     3 0 0 0            "
		puts "\n"
		sleep(0.12)

		puts "\n"

		sleep(0.12)

		puts "\n                   Coded by: Max Mahlke "

		sleep(0.12)

		puts "\n\n"


		5.times do 
			puts "  --------      --------      --------      --------      --------      --------      --------\n"
			sleep(0.12)
		end #end loop
		sleep(1)
		15.times do
			puts "  --------      --------      --------      --------      --------      --------      --------\n"
			sleep(0.12)
		end
	end

	def loading_display
		puts "\n\n\n\n\n\n\n"
		puts "--------------------------------------------------------------------------------"
		puts "                   LOADING DATABASE CONFIGURATIONS..."
		puts "--------------------------------------------------------------------------------"

		puts "\n\n\n"
		print "| "
		25.times do
			print "==="
			sleep(0.05)
		end

		print " |"

		puts "\n\n\n"


	end


	def display_accounts_menu
						
			puts "  =============================================================================="
			puts %q{  Please select an option: 
		  ==============================================================================
			
			possible 

				(1) -- SQL Commands.
				(2) -- Create an Account.
				(3) -- Look for a Person.
				(4) -- Login.
				(5) -- Browse Forum Posts.
				(6) -- Write a Post.
				(7) -- Set Admin Permissions.
				(8) -- Drop All Accounts.
				(9) -- Quit.


				}
					case gets.chomp
					when '1'
						sql_command_menu
					when '2'
						add_person
					when '3'
						puts "\n\n\n\n"
						puts "Accounts: "
						puts "------------------------------"
						display_all_people
						puts "------------------------------"
						puts "\n\n\n"
						puts "Enter the username or ID of the person you are looking for:\n\n"
						person_instance = find_person
					when '4'
						loading_display
						login
					when '5'
						loading_display
						display_all_posts
					when '6'
						if $session_id
							create_post
						else
							puts "\n\n\n\n |||     You Need to be SIGNED IN, to Post.     ||| \n\n\n\n"
						end
					when '7'
						loading_display
						puts "\n\n\n\n\n"
						puts "1.) Basic     Permissions"
						puts "2.) Admin     Permissions"
						puts "3.) Developer Permissions"
						puts "\n\n"
						puts "9.) Back\n\n\n"


						temp = gets.chomp



						case temp
						when '1'
							set_basic
						when '2'
							set_admin
						when '3'
							set_developer
						end ## end nested case



					when '8'
						# do nothing for now
					when '9'
						disconnect_and_quit
					else
						puts "Non-valid Entry."
				end #end case
	end





=end


	### VISUALS AND SHELL DISPLAYS ### -- ABOVE


	#run on startup
	def init_global_session_vars
		$session_id = nil
		$session_name = nil
		$session_job = nil
		$session_age = nil
		$session_gender = nil
		$session_access = nil
	end

	def set_global_session_vars(person_instance)
		#person_instance is an sql query, containing data in the people table.

		#main session id
		$session_id       = person_instance['id']

		$session_name     = person_instance['name']
		$session_job      = person_instance['job']
		$session_age      = person_instance['age']
		$session_gender   = person_instance['gender']
		$session_password = person_instance['password']
		$session_access   = person_instance['access']
	end




	def set_basic
		set_permissions("Basic")

	end

	def set_admin
		set_permissions("Admin")
	end

	def set_developer
		set_permissions("Developer")

	end


	def set_permissions(permission_type)
		puts "\n\n"
		puts "Enter the accounts name: "
		person_instance = find_person
		puts "\n\n\n\n=========================================="
		puts "Currently Selected Account: "
		puts "==========================================\n\n\n"

		sleep(0.5)
		puts "-  Username: #{person_instance['name']}. "
		puts
		sleep(0.5)
		puts "-  Internal User Id: #{person_instance['id']}. "
		puts
		sleep(0.5)

		puts "-  Account was created on 00/00/00."
		puts
		puts "\n\n"

		sleep(0.5)

		puts "             Modify this accounts permissions?    "
		puts "                 |  Yes  |   or   |  No  |       "
		puts
		puts


		response = gets.chomp
		if response.downcase == 'yes'
			puts "\n\n\n\n\n\n"
			sleep(1)

			#pass the user's name as an arg, so method can match the name to database
			modify_user_access(person_instance['name'], permission_type)

			puts "  !!   #{permission_type} Permissions Have Been Granted   !!\n\n\n"
			sleep(2)
		else
			puts "\n\nReturning to Main Menu...\n\n"
			sleep(1)
			return
		end


	end


	def display_all_posts


		list = $db.execute("SELECT * FROM posts")


		puts "\n\n\n\n"
		puts "Most Recent Posts: "
		puts "\n\n"
		unless list
			puts "No Posts Found."
			return
		end


		iteration = 1

		list.each do |x|
			puts "    #{iteration}.  |   Title:  #{x['subject']}   |   Author:  #{x['author']}   |    Karma:  #{x['karma']}   |\n\n"
			iteration += 1
		end


	end #end of method


	def write_post_subject
		puts "\n\n\n"
		puts "Please Type a subject line, or a title for your post."

		subject = gets.chomp
		if subject.length >= 30
			puts "Title must be under 30 characters. "
			puts "Please try again."
			write_post_subject
		else
			return subject
		end
	end

	def write_post_body
		puts "\n\n\n"
		puts "Please Type Your Entire Post Below. Press Enter when your have finished.\n\n\n"
		body = gets.chomp
		return body
	end

	def create_post
		my_subject  = write_post_subject #retrieve user's subject
		my_body     = write_post_body	 #retrieve user's post body
		this_post   = Post.new(my_subject, my_body) #create a post object
		this_post.display_post
		this_post.post_to_db
	end


	def create_posts_table
		puts "Creating posts table..."

		#this execute handle allows us to arbitrary sql commands as an argument
		$db.execute %q{ 
			CREATE TABLE posts (
				post_id integer primary key,
				author_id integer,
				author varchar(50),
				subject varchar(30),
				body varchar(650),
				karma integer
				)
		}
		puts "Table Successfully Created! you may now create posts!!"

	end ## End of create_posts_table

	class Post
		def initialize(subject, body)
			####
			@post_id    = 0
			####



			@autor_id   = $session_id
			#id for associating data tables

			@author     = $session_name
			#user that submitted

			@subject    = subject
			#post title

			@body       = body
			#post content

			@karma      = 0
			#posts rating

			@comments   = []
			#replies
		end

		def post_to_db

			$db.execute(
				"INSERT INTO posts ( author_id , author , subject , body , karma ) VALUES ( ? , ? , ? , ? , ? )",
				@author_id , @author , @subject , @body , @karma  )

		end

		def write_comment
			puts "What did you think about this post?"
			comment = gets.chomp
			@comments << comment
		end



		def display_post
			puts "\n\n\n"
			puts "=================================================================="
			puts "title  :  #{@subject}"
			puts "---------------------"
			puts "author : #{@author}"
			puts "---------------------"
			puts "karma  : #{@karma}"
			puts "==================================================================\n"
			puts "-------|Post Body|------------------------------------------------"
			puts "\n\n\n"
			puts @body
			puts "\n\n\n"

			puts "------------------------------------------------------------------"


			puts @content

			#display_post_comments
		end

		def display_post_comments

		end

		
	end ############# END POSTS sub-CLASS #############


	def drop_posts_table
		puts "Deleting Posts Table... "


		$db.execute %q{

			DROP TABLE posts

			}

	end

	def scroll_display
		10.times do 
			puts "  --------      --------      --------      --------      --------      --------      --------\n"
			sleep(0.12)
		end #end loop
		puts "\n\n\n"

		sleep(0.12)

		puts "           W e l c o m e     T o     A c c o u n t     S i m u l a t o r     3 0 0 0            "
		puts "\n"
		sleep(0.12)

		puts "\n"

		sleep(0.12)

		puts "\n                   Coded by: Max Mahlke "

		sleep(0.12)

		puts "\n\n"


		5.times do 
			puts "  --------      --------      --------      --------      --------      --------      --------\n"
			sleep(0.12)
		end #end loop
		sleep(1)
		15.times do
			puts "  --------      --------      --------      --------      --------      --------      --------\n"
			sleep(0.12)
		end
	end

	def loading_display
		puts "\n\n\n\n\n\n\n"
		puts "--------------------------------------------------------------------------------"
		puts "                   LOADING DATABASE CONFIGURATIONS..."
		puts "--------------------------------------------------------------------------------"

		puts "\n\n\n"
		print "| "
		25.times do
			print "==="
			sleep(0.05)
		end

		print " |"

		puts "\n\n\n"


	end


	def login
		#for username
		puts "\n\n"
		puts "Please Enter Your Username: "
		person_instance = find_person
		puts "Please Enter Your Password,   #{(person_instance['name']).capitalize}\n\n"
		pass_attempt = gets.chomp
		if pass_attempt == person_instance['password']
			puts "\n\n\nPassword authentication was successful!! "
			puts "welcome back, #{person_instance['name']}"
			set_global_session_vars(person_instance)

			puts "Session id = #{person_instance['id']}"

		else
			puts "Nice try, you twat! "
		end
	end



	def retrieve_person_vars(person_instance)
		id   = person['id']
		name = person['name']
		job  = person['job']
		gender = person['gender']
		password = person['password']

		puts id

	end

	## METHODS TO CALL ON DB. C.R.U.D. FUNCTIONALITY

	def sql_command_menu
		puts "\n\n\n\n"
		puts "======================="
		puts " Available Commands:  "
		puts "=======================\n\n"


		puts 
			puts %q{	Please select a command: 

				(1) -- Create People Table.
				(2) -- Create Posts Table.
				(3) -- Create All Tables.
				(4) -- Update People Table.
				(5) -- Update Posts Table.
				(6) -- Drop People Table.
				(7) -- Drop Posts Table.
				(8) -- Drop All Tables..
				(9) -- Quit.

				}

				case gets.chomp
				when '1'
					create_people_table
				when '2'
					create_posts_table
				when '3'
					create_people_table
					create_posts_table
				when '4'
					#update_people_table
				when '5'
					#update_posts_table
				when '6'
					drop_people_table
				when '7'
					drop_posts_table
				when '8'
					drop_posts_table
					drop_people_table
				when '9'
					disconnect_and_quit
				else
					puts "Non-valid Entry."

				end #end case


	end

	def disconnect_and_quit
		$db.close
		puts "Bye!"
		exit
	end

	def modify_user_access(passed_name, permission_type)

		$db.execute("
		UPDATE people
		SET access = ?
		WHERE name = ? " , permission_type , passed_name )



	end


	def create_people_table
		puts "Creating people table"

		#this execute handle allows us to arbitrary sql commands as an argument
		$db.execute %q{ 
			CREATE TABLE people (
				id integer primary key,
				name varchar(50),
				job varchar(50),
				gender varchar(6),
				age integer,
				password varchar(32),
				access varchar(15)

				)
		}

	end


	def drop_people_table
		puts "Deleting Table :( ... "


		$db.execute %q{

			DROP TABLE people

		}

	end



	def add_person
		puts "Enter Name: "
		name = gets.chomp
		puts "Enter Job: "
		job = gets.chomp
		puts "Enter Gender: "
		gender = gets.chomp
		puts "Enter Age: "
		age = gets.chomp
		puts "Enter Password: "
		password = gets.chomp
		puts "Verify Password"
		verify_password = gets.chomp
		if password == verify_password
			password = verify_password
		else
			"Passwords did not match! try again!!"
			exit
		end

		#now, use these var's to create a person instance in sql db
		$db.execute(
			"INSERT INTO people ( name , job , gender , age , password , access ) VALUES ( ? , ? , ? , ? , ? , ? )",
			 name, job, gender, age, password, "Basic"  )		
	end

	def display_all_people
		list = $db.execute("SELECT name FROM people")

		unless list
			puts "No People Found."
			return
		end
		iteration = 1
		list.each do |x|
			puts "#{iteration}.    --    #{x['name'].capitalize}"
			iteration += 1
		end
	end

	def find_person

		id = gets.chomp




		person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?",id, id.to_i).first

		unless person
			puts "No result found."
			return
		end

		#output query results
		puts %Q{	
					Name:   #{person['name'] }
					Job:    #{person['job'] }
					Gender: #{person['gender'] }
					Age:    #{person['age'] }
					Access: #{person['access']}   }


		return(person)
	end




#on startup, reset all session variables
init_global_session_vars

scroll_display

	loop do 
		puts "\n\n"


		if $session_id == nil 
			
			display_accounts_menu

				puts "  =============================================================================="
				puts %q{  Please select an option: 
	  ==============================================================================


					(1) -- SQL Commands.
					(2) -- Create an Account.
					(3) -- Look for a Person.
					(4) -- Login.
					(5) -- Browse Forum Posts.
					(6) -- Write a Post.
					(7) -- Set Admin Permissions.
					(8) -- Drop All Accounts.
					(9) -- Quit.


					}
						case gets.chomp
						when '1'
							sql_command_menu
						when '2'
							add_person
						when '3'
							puts "\n\n\n\n"
							puts "Accounts: "
							puts "------------------------------"
							display_all_people
							puts "------------------------------"
							puts "\n\n\n"
							puts "Enter the username or ID of the person you are looking for:\n\n"
							person_instance = find_person
						when '4'
							loading_display
							login
						when '5'
							loading_display
							display_all_posts
						when '6'
							if $session_id
								create_post
							else
								puts "\n\n\n\n |||     You Need to be SIGNED IN, to Post.     ||| \n\n\n\n"
							end
						when '7'
							loading_display
							puts "\n\n\n\n\n"
							puts "1.) Basic     Permissions"
							puts "2.) Admin     Permissions"
							puts "3.) Developer Permissions"
							puts "\n\n"
							puts "9.) Back\n\n\n"


							temp = gets.chomp



							case temp
							when '1'
								set_basic
							when '2'
								set_admin
							when '3'
								set_developer
							end ## end nested case



						when '8'
							# do nothing for now
						when '9'
							disconnect_and_quit
						else
							puts "Non-valid Entry."
						end #end case

		else #if user is signed in

			puts '-----------------------------------------------------------------'
			puts "Current Access = #{$session_access}   ||   User: #{$session_name}   ||   Gender: #{$session_gender}"
			puts '-----------------------------------------------------------------'
			puts "\n\n"


			puts %q{	Please select an option: 

				(1) -- SQL Commands.
				(2) -- Create an Account.
				(3) -- Look for a Person.
				(4) -- Logout.
				(5) -- Browse Forum Posts.
				(6) -- Write a Post.
				(7) -- Set Admin Permissions.
				(8) -- Drop All Accounts.
				(9) -- Quit.

				}

				case gets.chomp
				when '1'
					sql_command_menu
				when '2'
					add_person
				when '3'
					puts "\n\n\n\n"
					puts "Accounts: "
					puts "------------------------------"
					display_all_people
					puts "------------------------------"
					puts "\n\n\n"
					puts "Enter the username or ID of the person you are looking for:\n\n"
					person_instance = find_person

				when '4'
					init_global_session_vars
					puts "\n\n\n\n ||   Session Expired!   ||  \n\n\n\n"
				when '5'
					display_all_posts
				when '6'

						if $session_id
							create_post
						else
							puts "\n\n\n\n |||     You Need to be SIGNED IN, to Post.     ||| \n\n\n\n"
						end

				when '7'
					loading_display
					puts "\n\n"
					set_permissions
				when '8'
					# Do Nothing for now
				when '9'
					disconnect_and_quit
				else
					puts "Non-valid Entry."
				end #end case



		end ## END OF IF

 	
			puts "\n\n"
			puts "Press Enter to continue. "
			puts "\n"
			gets.chomp

	end #end loop

