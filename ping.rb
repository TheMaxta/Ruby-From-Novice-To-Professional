require 'rubygems'
require 'net/ping'





def test(url)
	puts "Testing #{url}.....\n"
	if Net::Ping::External.new(url).ping
		puts "Pong!"
	else
		puts "No Response!!"
	end
	puts "\n\n"
end

def get_url
	puts "Please enter your Websites appropriate url.."
	url = gets.chomp
	return url
end


client_url = 'go'
until client_url == 'stop'
	client_url = get_url
	test(client_url)
end