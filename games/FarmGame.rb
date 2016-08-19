$total = 0

class Peartree

	def initialize
		@height = 1
		@pears = 0
		@money = $total
		puts 'Nice! you might just survive as a Tree Farmer!'
		puts 'PearTree grows 2x as fast as Apple and OrangeTrees and lasts up to 50 years!'
		puts 'Pears will yield you 10$ per pick!'
		puts 'However, they will not start growing pears, til year 10'
	end

	def grow 
		@height = @height + 1	
		puts 'Your PearTree grows by 1 foot!'
		puts  'Peartree is now ' + @height.to_s + ' feet tall'
		oneYearPasses2

		puts
		puts
	end
	def count
		puts "pears    :   " + @pears.to_s
		puts
		puts
	end

	def pick
		puts
		puts
		puts 'You pick an apple, and it tastes meh'
		@pears = @pears - 1
		money
		money
		money
		money
		money
		money
		money
		money
		money
		money

		puts 'However, you can sell it to a neighbor 3$'
		puts 'money : ' + $total.to_s + "$"

		puts "pears left-over   :   " + @pears.to_s
		puts
		puts
	end
	
end

private

def money
	@money = @money + 1
	$total = $total + 1

end	

def oneYearPasses2
	if @height == 7
		puts 'The Peartree starts growing its first pears!!'
		@pears = 1

		end
	if @height > 7
		puts 'The Peartree grows some pears!'	
		@pears = @pears + 1
	end

	if @height > 10
		@pears = @pears + 3
	end

	if @height == 30
		puts 'The PearTree has reched its maximum height!'
		puts
		puts

	end
end
	




class AppleTree

	def initialize
		@height = 1
		@apples = 0
		@money = $total
		puts 'Nice! you might just survive as a Tree Farmer!'
		puts 'AppleTree grows 2x as fast as OrangeTrees and lasts up to 30 years!'
		puts 'Apples will yield you 3$ per pick!'
		puts 'However, they will not start growing apples, til year 7'
	end

	def grow 
		@height = @height + 1	
		puts 'Your AppleTree grows by 1 foot!'
		puts  'AppleTree is now ' + @height.to_s + ' feet tall'
		oneYearPasses1

		puts
		puts
	end
	def count
		puts "Apples    :   " + @apples.to_s
		puts
		puts
	end

	def pick
		puts
		puts
		puts 'You pick an apple, and it tastes meh'
		@apples = @apples - 1
		money
		money
		money

		puts 'However, you can sell it to a neighbor 3$'
		puts 'money : ' + $total.to_s + "$"

		puts "Apples left-over   :   " + @apples.to_s
		puts
		puts
	end
	
end

private

def money
	@money = @money + 1
	$total = $total + 1

end	

def oneYearPasses1
	if @height == 7
		puts 'The AppleTree starts growing its first Apples!!'
		@apples = 1

		end
	if @height > 7
		puts 'The appltree grows some apples!'	
		@apples = @apples + 1
	end

	if @height > 10
		@apples = @apples + 3
	end

	if @height == 30
		puts 'The AppleTree has reched its maximum height!'
		puts
		puts

	end
end
	




class OrangeTree



	def initialize 	
		@height = 1
		@money = 0
		puts 'You find an OrangeTree in your backyard.'
		puts 'The tree is already 1 foot tall!'
		puts 'I wonder how big it will get!!'
		puts 
		puts


	end

	def grow
		@height = @height + 1	
		puts 'Your OrangeTree grows by 1 foot!'
		puts '======================================================'
		puts  'OrangeTree is now ' + @height.to_s + ' feet tall'
		puts '======================================================'
		oneYearPasses

		puts
		puts
	end
	def count
		puts
		puts
		puts "Oranges    :   " + @oranges.to_s
	end

	def pick
		puts
		puts
		puts 'You pick an orange, and it tastes like ass'
		@oranges = @oranges - 1
		money
		puts 'However, you can sell it to some homeless people for 1$'
		puts 'money : ' + $total.to_s + "$"

		puts "Oranges left-over   :   " + @oranges.to_s
		puts
		puts
	end
	
end

private

def oneYearPasses
	if @height == 3
		puts 'The OrangeTree Finally starts growing its first oranges!!'
		puts 'Be careful!! if OrangeTree dies, you lose.. it will last '
		puts 'until it is 30 feet tall! you can set it back to zero by buying it in the store.'
		@oranges = 2

		end
	if @height > 3

		puts 'The orange tree grows some Oranges.'
		@oranges = @oranges + 1
	end
	if @height > 6
		@oranges = @oranges + 1
	end
	if @height > 10 
		@oranges = @oranges + 4
	end

	if @height == 30
		puts 'The OrangeTree has reched its maximum height!'
		puts
		puts
		puts 'GAME OVER'
		exit
	end
	end
def money
	@money = @money + 1
	$total = $total + 1

end	
	

tree = OrangeTree.new
puts
puts
puts
puts
puts 
puts
puts
puts '---------------------------------------------------------------'
puts
puts 'This is OrangeTree farmer simulator!!'
puts 'Get a glimpse at the SUPER-interesting life of a farmer!'
puts
puts 'Your goal is to make is much profit as possible, '
puts 'while not letting your OrangeTree die! '
puts 
puts 'IF you let the OrangeTree die, the game WILL END..'
puts 'type the below keywords and press enter to play!'
puts 'View    : this will show you what your farm looks like!'
puts 'Wait    : this will make a year pass!'
puts 'Count   : this will count how many oranges your tree has!'
puts 'Pick    : this will pick an orange down for you!'
puts 'pick5   : this will pick 5 oranges at once.'
puts 'Store   : this will access the farmers store!'
puts 'Help    : this will access this menu again!'
puts 'Stop    : exit this horrendous game. '
puts "Have Fun!!"
puts
puts '---------------------------------------------------------------'
puts



# this is where every key access point is!
user = 1
while user != 0

user = gets.chomp.capitalize


	if user == 'Store'
		puts
		puts
		puts
		puts
		puts
		puts 'Welcome to My tree store!!'
		puts 'Increase your annual income, by purchasing another tree!'
		puts "______________________________________________________________"
		puts
		puts ' - - - - - - - - - - - - - - - - -'
		puts 'your money : ' + $total.to_s
		puts ' - - - - - - - - - - - - - - - - -'
		puts 'OrangeTree :  cost : 10$  (will replenish life)'
		puts 'AppleTree  :  cost : 25$'
		puts 'PearTree   :  cost : 50$'
		puts 'PumpkinTree:  cost : 100$'
		puts 'MoneyTree  :  cost : 1000$'
		puts '______________________________________________________________'
		puts
		puts
		puts
		puts
		puts
		puts 'Type any tree you wish to purchase!'
		puts 'type exit to exit'
		$store = 0
		while $store != 1

		  buy = gets.chomp.capitalize

			if buy == 'Orangetree'
				if $total > 10
				tree = OrangeTree.new
				$total = $total - 10
				$store = 1
				end
				if $total < 10
					puts 'Sorry, insufficient funds.'
					puts
					puts 'type exit to leave store'
				end
			end
			if buy == 'Appletree'
				if $total > 25
				tree1 = AppleTree.new
				$total = $total - 25
				$store = 1
				puts "------------"
				puts ' IMPORTANT : type pickapple to pick your apples!'
				puts " -----------"
				end
				if $total < 25
					puts 'Sorry, insufficient funds.'
					puts
					puts 'type exit to leave store'
				end
			end
			if buy == 'Peartree'
				if $total > 50
					tree2 = Peartree.new
					$total = $total - 50
					$store = 1
					puts "------------"
					puts ' IMPORTANT : type pickpear to pick your pears!'
					puts " -----------"
					puts
				end
				if $total < 50
					puts 'Sorry, insufficient funds.'
					puts
					puts 'type exit to leave store'
				end
			end
			if buy == 'Pumpkintree'
			end
			if buy == 'Moneytree'
			end
			if buy == 'Exit'
				puts
				puts 'Thanks for visiting!!'
				puts 'You are back to the game now! type help if you need it :)'
				 $store = 1
			end
		end
	end





	if user == 'Help'
		puts 
		puts
		puts
		puts
		puts
		puts 'This is OrangeTree farmer simulator!!'
		puts 'Get a glimpse at the SUPER-interesting life of a farmer!'
		puts 'Your goal is to grow as many oranges as possible!'
		puts 'type these and press enter to play!'
		puts 'Wait    : this will make a year pass!'
		puts 'Count   : this will count how many oranges your tree has!'
		puts 'Pick    : this will pick an orange down for you!'
		puts 'pick5   : this will pick 5 oranges at once.'
		puts 'Stop    : exit this horrendous game. '
		puts 'Store   : this will access the farmers store!'
		puts 'Help    : this will access this menu again!'
		puts "Have Fun!!"
		puts
		puts








		end
	if user == 'Wait_more'
		puts "====================================================================="
		puts 'type any number 1-30 and we will wait for that many years...'
		puts "====================================================================="

		time = gets.chomp.to_i


		(time).times do
		tree.grow
		if tree1
			tree1.grow
		end	
		if tree2
			tree2.grow
		end
	end
			puts '-------------------------------'
			puts ''
	end


	if user == 'Wait'

		tree.grow
			if tree1
				tree1.grow
			end #tree1
			if tree2
					tree2.grow
			end # tree2
			
	end # if user=wait
	if user == 'Count'
		tree.count
			if tree1
				tree1.count
			end
	end # if 2
	if user == 'Pick'
		tree.pick
	end # if 3
	if user == 'Pick_more'

		puts "====================================================================="
		puts 'type any number 1-30 and we will pick that many...'
		puts "====================================================================="
		pickValue = gets.chomp.to_i		
		(pickValue).times do
		tree.pick.to_s
		end

	end
	if user == 'Pickapple'
		tree1.pick
	end
	if user == 'Stop'
		exit
	end

	if user == 'Cheat'
	$total = $total + 10000
	puts 'cheatcode executed!'
	end	
end # while 
exit

