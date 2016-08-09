class Class
	def add_accessor(accessor_name)
		Person.class_eval %Q{
			attr_accessor :#{accessor_name}
		}
	end
end


#contains nothing
class Person
end


#another method
class AnotherPerson
	add_accessor :whatever
end

test = AnotherPerson.new
test.whatever = "cool, bro"
puts test.whatever

person = Person.new
Person.add_accessor :name
Person.add_accessor :gender
Person.add_accessor :age
Person.add_accessor :intellect

person.name = "Donald Trump"
person.gender = "female"
person.age = 90
person.intellect = "monkey"
puts %Q{#{person.name} is #{person.age} years old, he is #{person.gender}, with an intellectual capacity of a #{person.intellect}}


test = Person.new
test.name = "Max Mahlke"
test.age  = 18
test.intellect = "average"
puts %Q{#{test.name} is #{test.age} years old, he is #{test.gender}, with an intellectual capacity of below #{test.intellect}}