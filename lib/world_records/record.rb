class WorldRecords::Record
  attr_accessor :title, :url, :text, :who, :when
  
  @@all = []
  
  def initialize(title, url)
    @title = title
    @url = url
    self.all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create_from_index
    all_articles = Scraper.scrape_index_page.css("div.explore-list-wrap a")
    all_articles.each do |article|
      title = article.css("figure.result-media img").attribute("alt").text
      url = "http://www.guinnessworldrecords.com" + article.css("a").attribute("href").value
      record = Record.new(title,url)
      Record.all << record
      end
    Record.all
  end
  
  def find_by_number(number)
    Record.all[number-1]
  end
    
   def add_details(record_details)
      record_details.each do |attr, value|
        self.send("#{attr}=", value)
      end
      self
   end
  
end