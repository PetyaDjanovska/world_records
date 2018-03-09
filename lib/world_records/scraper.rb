class WorldRecords::Scraper

  BASE_URL = "http://www.guinnessworldrecords.com"

  def self.scrape_index_page
    page = Nokogiri::HTML(open("http://www.guinnessworldrecords.com/records/showcase/sports-and-strength"))
    page.css("div.masonry a").each do |article|
      title = article.css("figure.result-media img").attribute("alt").text
      url = "http://www.guinnessworldrecords.com" + article.attribute("href").value
      record = WorldRecords::Record.new(title, url)
    end
    WorldRecords::Record.all
  end  

  def self.scrape_record_page(url)
    doc = Nokogiri::HTML(open(url))
    record_details = {}
    record_details[:who] = doc.css("div.equal-one dd").first.text
    record_details[:when] = doc.css("div.equal-one dd time").text
    record_details[:text] = doc.css("div.body-copy").text.strip
    record_details
  end

  def get_text(doc)
    
  end

  def get_who(doc)
    
  end

  def get_when(doc)
    
  end
end
