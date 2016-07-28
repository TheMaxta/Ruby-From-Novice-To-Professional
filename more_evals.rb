

##My Personal Attribute_Accessor! 
class Class
	def add_accessor(accessor_name)
		self.class_eval %Q{
			def #{accessor_name}
				@#{accessor_name}
			end
			def #{accessor_name}=(value)
				@#{accessor_name}=value
			end
		}
	end #end of main method
end

class Person
	add_accessor :name
end


obj = Person.new
obj.name = "max"
puts obj.name
