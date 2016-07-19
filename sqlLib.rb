require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true
puts $db



	#run on startup
	def init_global_session_vars
		$session_id = nil
		$session_name = nil
		$session_job = nil
		$session_age = nil
		$session_gender = nil
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
				password varchar(32)

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
			"INSERT INTO people (name, job, gender, age, password) VALUES (?,?,?,?,?)", name, job, gender, age, password)
		
	end

	def find_person
		puts "Enter a name or ID of person to find:"
		id = gets.chomp

		person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?",id, id.to_i).first

		unless person
			puts "No result found"
			return
		end

		#output query results
		puts %Q{	
					Name: #{person['name'] }
					Job: #{person['job'] }
					Gender: #{person['gender'] }
					Age: #{person['age'] }   }

		return(person)
	end




#on startup, reset all session variables
init_global_session_vars

	loop do 
		puts "\n\n"


		if $session_id == nil 
			

			puts %q{	Please select an option: 

				1. Create people table.
				2. Add a person.
				3. Look for a person.
				4. Login.


				9. Quit.



				}
				case gets.chomp
				when '1'
					create_table
				when '2'
					add_person
				when '3'
					person_instance = find_person
				when '4'
					login

				when '9'
					disconnect_and_quit
				else
					puts "Non-valid Entry."
				end #end case

		else

			puts '-----------------------------------------------------------------'
			puts "Current Session = #{$session_id}   ||   User: #{$session_name}   ||   Gender: #{$session_gender}"
			puts '-----------------------------------------------------------------'
			puts "\n\n"


			puts %q{	Please select an option: 

				1. Create people table.
				2. Add a person.
				3. Look for a person.
				4. Logout.


				8. Drop people table.
				9. Quit.

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
			puts "Press Enter to return to Menu."
			puts "\n"
			gets.chomp

	end #end loop




