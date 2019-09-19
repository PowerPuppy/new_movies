class NewMovies::Scraper
  require 'nokogiri'
  require 'open-uri'
  site = "https://www.fandango.com/"

  doc = Nokogiri::HTML(open(site))

  items = doc.css("li.media")

  puts items.count

  # articles = items.select{|item| item.css("figcaption.gallery-caption").count != 0}
  # articles.count

   items.each do |article|
     title = article.css("a.heading-style-1").text
     url = article.css("a")[0].attributes["href"]
     puts url
     puts title
   end

end
