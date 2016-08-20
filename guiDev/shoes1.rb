Shoes.app(:width => 400, :height => 180) do 
	button("Get A Date!!", :top => 0.5, :left => 0.2) do   ## Shoes interprets floating points as percentages.
		alert "Current Date: #{Time.now}"
	end

	button("Get A Random Number", :top => 0.5, :left => 0.5) do
		alert rand(100)
	end
end