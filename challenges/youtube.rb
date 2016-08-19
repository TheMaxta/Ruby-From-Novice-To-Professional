require 'HTTParty'		#sends request to page
require 'Nokogiri'		#places xml info into ruby object
require 'JSON'			
require 'Pry'			#debugging gem	
require 'csv'

def validate(string)
	if string.include?("/watch?v=")
		return true
	else
		return false
	end
end

puts "Please paste in the video_tag, and press enter.."
video_tag = gets.chomp
result = validate(video_tag)
if result
else
	exit()
end

puts "How many times should we load??"
n = gets.chomp.to_i

n.times do |x|
	page = HTTParty.get("https://www.youtube.com#{video_tag}")
	parse = Nokogiri::HTML(page)
	views = parse.css('.watch-view-count').text
	puts views
	puts "loading page for the #{x}th time.."
	sleep(10)
end
#pass html string to nokogiri ruby object


