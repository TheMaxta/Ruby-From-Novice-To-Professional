#require 'rubyGems'
require 'net/http'

# target URL
url = URI.parse('http://www.rubyinside.com/')


## pass all html to string
response = Net::HTTP.start(url.host, url.port) do |http|
	http.get(url.path)
end

content = response.body
puts content


## find all links
link_count = content.scan('<a href=').length

secure_link_count = content.scan("<a href=\"https").length

## find all scripts
script_count = content.scan('<script').length

# find all meta tags
meta_count = content.scan("<meta").length

# find html comments
comment_count = content.scan("<!--").length


links_to_facebook = content.scan("<a href=\"http://facebook").length
temp = content.scan("<a href=\"https://facebook").length
links_to_facebook = links_to_facebook + temp




links_to_twitter = content.scan("<a href=\"http://twitter").length
temp2 = content.scan("<a href=\"https://twitter").length
links_to_twitter = links_to_twitter + temp2


puts "Total links on page:             #{link_count}"
puts "Total secure links:              #{secure_link_count}"
puts "Total scripts on page:           #{script_count}"
puts "Total meta tags on page:         #{meta_count}"
puts "Total html comments on page:     #{comment_count}"
puts "Total links leadig to Facebook:  #{links_to_facebook}"
puts "Total links leadig to Twitter:   #{links_to_twitter}"