class WorldRecords::Record
  attr_accessor :title, :url, :text, :who, :when

  @@all = []

  def initialize(title, url)
    @title = title
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_index
    all_articles = WorldRecords::Scraper.scrape_index_page.css("div.explore-list-wrap a")
    all_articles.each do |article|
      title = article.css("figure.result-media img").attribute("alt").text
      url = "http://www.guinnessworldrecords.com" + article.css("a").attribute("href").value
      record = self.new(title,url)
      end
    self.all
    binding.pry
  end

  def self.find_by_number(number)
    self.all[number.to_i - 1]
  end

   def add_details(record_details)
      record_details.each do |attr, value|
        self.send("#{attr}=", value)
      end
      self
   end

end
