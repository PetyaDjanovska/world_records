class WorldRecords::Scraper
  
  BASE_URL = "http://www.guinnessworldrecords.com"
  
  def self.scrape_index_page
    page = Nokogiri::HTML(open("http://www.guinnessworldrecords.com/records/showcase/sports-and-strength"))
  end
  
  def self.scrape_record_page(url)
    doc = Nokogiri::HTML(open(url))
    record_details = {}
    record_details[:who] = get_who(doc)
    record_details[:when] = get_when(doc)
    record_details[:text] = get_text(doc)
    record_details
  end
  
  def get_text(doc)
    doc.css("div.body-copy").text.strip
  end
  
  def get_who(doc)
    doc.css("div.equal-one dd").first.text
  end
  
  def get_when(doc)
    doc.css("div.equal-one dd time").text
  end
  
end