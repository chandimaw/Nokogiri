require 'rubygems'
require 'nokogiri'
require 'open-uri'

url="https://www.reddit.com/"
doc=Nokogiri::HTML(open(url)) #open function opens the webpage, then Nokogiri parses it into the doc variable as HTML

titles = doc.css('.entry')

titles.each do |title|
	# selector string p.title>a means <p> with a class of title, and then get <a> immedietly under that.
	puts title.css('p.title>a').text
	#Display links - find href attribute
	#attributes are stored as the first child of the object => [0]['href'] to get the link.
	puts title.css('p.title>a')[0]['href']
end