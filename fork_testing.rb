child = fork do 
	sleep 3
	puts "Child says 'hi'!"
end

puts "Waiting for the child process....."
Process.wait child #Just tells fork process to wait for other program
puts "All done!"