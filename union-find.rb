## quick find implementation and testing for union find...

class Unionize

	def initialize(n)
		@n = n
		@n -= 1;
		@id = []
		setArray()

		#response = connected?(@id[1],@id[1])

	end

	def controller
	end

	def setArray()
		for i in 0..@n do
			@id[i] = i
		end
	end

	def root(i)
		while (i != @id[i]) do 
			@id[i] = i 
		end
		return i
	end

	def connected?(p,q)
		if root(p) == root(q)
			return true;
		else
			return false;
		end
	end

	def union(p,q)
		#execute only if connected? returns true. 
		i = root(p)	# current val
		j = root(q) # targetted val
		@id[i] = j  # j = new root for current val.

	end


end #end unionize class

test = Unionize.new(4)