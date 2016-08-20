Shoes.app(:width => 300, :height => 300) do
	flow :width => 0.9, :height => 0.8, :margin => 5 do
		%w{ 7 8 9 / 4 5 6 * 1 2 3 + 0 C = - }.each do |key|
			button key, :width => 0.22, :height => 0.22 do 
					alert "You Pressed #{key} !!!"
			end ## end buttons
		end ## end each
	end ## end flow
end #end main