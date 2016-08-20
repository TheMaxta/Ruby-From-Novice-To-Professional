def daemonize
	fork do 
		Process.setsid ## session id for OS
		exit if fork
		Dir.chdir('/') ## Set Root access
		STDIN.reopen('/dev/null')
		STDOUT.reopen('/dev/null', 'a')
		STDERR.reopen('/dev/null', 'a')
		trap("TERM") { exit }
		yield
	end
end

daemonize do 
	# You can do whatever you like in here and it will run in the background entirely
	#    separated from the parent process..

end

puts "The Daemon process has been launched!! AHHHH!! DAEMONS!!!"