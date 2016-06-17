class Dungeon
	attr_accessor :player

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)		#Pushes a new room to @rooms (all rooms in dungeon)
	end

	def start(location)													#accepts a location as argument (:symbol)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description	## prints output from find_room method, and passes it players location
	end

	def find_room_in_dungeon(reference)
		@rooms.detect {|room|  room.reference == reference }	## returns current val, when matches
	end



	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end


	class Room
		attr_accessor :reference, :name, :description, :connections

		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description
			@name + "\n\nYou are in " + @description
		end
	end



end


#Create dungeon object
dungeon1 = Dungeon.new("TheMaxta")


#add rooms here
dungeon1.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave } )
dungeon1.add_room(:smallcave, "Small Cave", "claustrophobic cave", { :east => :largecave })

#start dungeon by placing player in the large cave
dungeon1.start(:largecave)