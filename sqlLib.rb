require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true
puts $db

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
				age integer

				)
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

		#now, use these var's to create a person instance in sql db
		$db.execute(
			"INSERT INTO people (name, job, gender, age) VALUES (?,?,?,?)", name, job, gender, age)
		
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


	end

	loop do 
		puts "\n\n"
		puts %q{	Please select an option: 

			1. Create people table.
			2. Add a person.
			3. Look for a person.
			4. Quit



			}

			case gets.chomp
			when '1'
				create_table
			when '2'
				add_person
			when '3'
				find_person
			when '4'
				disconnect_and_quit
			end #end case

			puts "\n\n"
			puts "Press Enter to return to Menu."
			puts "\n"
			gets.chomp
		end #end program loop