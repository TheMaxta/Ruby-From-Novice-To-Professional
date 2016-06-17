class ParentClass
	def method1 
		puts "Hello from method1 in the parent class"
	end

	def method2
		puts "Hello from method2 in the parent class"
	end
end


# shows inheritance
class ChildClass < ParentClass
	def method2
		puts "Hello  from method2 in the child class"

		super # super finds the next highest inheritance, and calls the method for that...
	end
end

my_object = ChildClass.new

# Works, by inhereting method 1 from parent
my_object.method1


# Ignores inheritance, uses class method instead
my_object.method2