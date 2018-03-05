#CLI controller
class WorldRecords::CLI
  
  def call
    puts "World records in sports:"
    list_records
    puts "To read more about a record type its number, to see the list again - type list, type exit to leave!"
    input = gets.strip
    while input != "exit"
      display_record(input)
      if input =="list"
      list_records
      end
    end
     puts "Good bye!"
  end
  
  def list_records
    WorldRecords::Record.all.each.with_index do |record,i|
      puts "#{i+1}. #{record.title}"
    end
  end
  
  def display_record(number)
    selected_record = WorldRecords::Record.all.find_by_index(number-1)
    selected_record.add_details(Scraper.scrape_record_page(selected_record.url))
    puts "selected_record.title.upcase"
    puts "WHO - #{selected_record.who}.upcase"
    puts "WHEN - #{selected_record.when}"
    puts "#{selected_record.text}"
  end
  
end