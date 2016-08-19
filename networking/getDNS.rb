#Program retrieves an associated IP to the user-entered Domain.. 

require 'resolv'

puts "\n\nGoogle.com IP addresses:"
Resolv.each_address("www.google.com") do |ip|
	puts ip
end
puts "\n"

ip = "216.58.217.4"

begin
	puts Resolv.getname(ip)
rescue
	puts "No associated Hostname found with ip: #{ip}"
end

