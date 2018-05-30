class ScraperDemo
	require 'open-uri'
	require 'nokogiri'
	doc= Nokogiri::HTML(open("https://stackoverflow.com/?tab=featured"))
  	data=doc.css('.summary')
  	print "total:= ",data.length,"\n"
  	i=1
  	data.each do |d|
	  	print "#{i} Title=> ",d.css('h3>a').text,"\n"
	  	print "Link=> ",d.css('h3>a')[0]['href'],"\n"
	  	puts "\n"
	  	i=i+1
  end
end