child = fork do 
	sleep 3
	puts "Child says 'hi'!"
end

puts "Waiting for the child process....."
child
Process.wait child
puts "All done!"