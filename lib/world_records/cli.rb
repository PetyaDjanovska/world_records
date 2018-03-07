#CLI controller

class WorldRecords::CLI

  def call
    puts "World records in sports:"
    WorldRecords::Scraper.scrape_index_page
    list_records
    input = nil
    while input != "exit"
      puts "To read more about a record - type its number, to see the list again - type list, type exit to leave!"
      input = gets.strip.downcase
        if input.to_i > 0
          display_record(input)
        elsif input == "list"
          list_records
        else
          puts "To read more about a record - type its number, to see the list again - type list, type exit to leave!"
        end
     end
    puts "Good bye!"
  end
     
       
  def list_records
    records = WorldRecords::Record.all
    records.each.with_index do |record,i|
      puts "#{i+1}. #{record.title}"
    end
  end

  def display_record(number)
    selected_record = WorldRecords::Record.find_by_number(number)
    url = selected_record.url
    selected_record.add_details(WorldRecords::Scraper.scrape_record_page(url))
    puts "#{selected_record.title.upcase}"
    puts "WHO - #{selected_record.who.upcas}"
    puts "WHEN - #{selected_record.when}"
    puts "#{selected_record.text}"
  end

end
