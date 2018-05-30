class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'open-uri'
  def scrape_reddit
=begin
  	doc= Nokogiri::HTML(open("https://stackoverflow.com/"))
  	render plain: doc.inspect 
  	data=doc.css('.summary')
=end
  	#render plain: questions.inspect 
  end
end
