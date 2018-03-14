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
