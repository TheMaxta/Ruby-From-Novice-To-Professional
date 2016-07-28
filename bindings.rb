def binding_elsewhere
	x = 20
	return binding
end

remote_binding = binding_elsewhere
x = 10
eval("puts x")
eval("puts x", remote_binding)
puts "\n\n\n\n"

#contains nothing
class Person
end


def add_accessor_to_person(accessor_name)
	Person.class_eval %Q{
		attr_accessor :#{accessor_name}
	}
end

person = Person.new
add_accessor_to_person :name
add_accessor_to_person :gender
add_accessor_to_person :age
add_accessor_to_person :intellect

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