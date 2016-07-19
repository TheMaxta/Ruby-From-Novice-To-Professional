require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true



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

	def set_access
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

		puts "  Give this account administration access? "
		puts "     -------| Yes | or | No |-------       "
		sleep(1.8)
		puts
		puts
		response = gets.chomp
		if response.downcase == 'yes'
			person_instance['access'] = "Admin"
			puts "\n\n\n\n\n\n"
			sleep(1)
			puts "  !!   Admin Privileges Have Been Granted   !!\n\n\n"
			sleep(2)
		else

			sleep(1)
			return
		end


	end











	def scroll_display
		10.times do 
			puts "   -----         -----         -----         -----         -----         -----         -----\n"
			sleep(0.12)
		end #end loop
		puts "\n\n"

		sleep(0.12)

		puts "                 Welcome    To    Account    Simulator    2016   ! ! !      "

		sleep(0.12)

		puts "\n"

		sleep(0.12)

		puts "                 Coded by: Max Mahlke "

		sleep(0.12)

		puts "\n\n"


		5.times do 
			puts "   -----         -----         -----         -----         -----         -----         -----\n"
			sleep(0.12)
		end #end loop
		sleep(1)
		15.times do
			puts "   -----         -----         -----         -----         -----         -----         -----\n"
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
			sleep(0.1)
		end

		print " |"

		puts "\n\n\n"


	end










	def login
		#for username
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
	def disconnect_and_quit
		$db.close
		puts "Bye!"
		exit
	end

	def create_table
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


	def delete_table
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
			"INSERT INTO people (name, job, gender, age, password, access) VALUES (?,?,?,?,?,?)", name, job, gender, age, password, "Basic")
		
	end

	def find_person
		puts "\n\n"
		puts "Enter a name or ID of person to find:"
		id = gets.chomp

		person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?",id, id.to_i).first

		unless person
			puts "No result found"
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
			
			puts "  =============================================================================="
			puts %q{  Please select an option: 
  ==============================================================================


			(1) --  Create people table.
			(2) --  Add a person.
			(3) --  Look for a person.
			(4) --  Login.

			(7) --  Set admin accounts.
			(8) --  Drop people table.
			(9) --  Quit.



				}
				case gets.chomp
				when '1'
					loading_display
					create_table
				when '2'
					add_person
				when '3'
					person_instance = find_person
				when '4'
					loading_display
					login
				when '5'
					#future use
				when '6'
					loading_display
				when '7'
					set_access
				when '8'
					delete_table
				when '9'
					disconnect_and_quit
				else
					puts "Non-valid Entry."
				end #end case

		else

			puts '-----------------------------------------------------------------'
			puts "Current Access = #{$session_access}   ||   User: #{$session_name}   ||   Gender: #{$session_gender}"
			puts '-----------------------------------------------------------------'
			puts "\n\n"


			puts %q{	Please select an option: 

				(1) -- Create people table.
				(2) -- Add a person.
				(3) -- Look for a person.
				(4) -- Logout.


				(8) -- Drop people table.
				(9) -- Quit.

				}
				case gets.chomp
				when '1'
					create_table
				when '2'
					add_person
				when '3'
					person_instance = find_person
				when '4'
					logout
				when '8'
					delete_table
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




