require 'unirest'
require './controllers/entries_controller.rb'
require './models/entry.rb'
require './views/entries_views.rb'

class Frontend

    include EntriesController
    include EntriesView

  def run
    
    system 'clear'


    puts "Welcome to My Contacts"
    puts "=" * 80
    puts "     Press [1] For all contacts"
    puts "     --Press [1.1] To search contacts with a provided first name"
    puts "     Press [2] To add a new contact"
    puts "     Press [3] To find a specific contact"
    puts "     Press [4] to update a contact"
    puts "     Press [5] to destroy a contact entry"

    input_option = gets.chomp

    
    if input_option == "1"
      entries_index_action

    elsif input_option == "1.1"
      print "Please enter a name to search by: "
      search_name = gets.chomp

      response = Unirest.get("http://localhost:3000/entries?search=#{search_name}")
      entries = response.body
      puts JSON.pretty_generate(entries)

    elsif input_option == "2"
      entries_create_action

    elsif input_option == "3"
      entries_show_action
    elsif input_option == "4"
      entries_update_action

    elsif input_option == "5"
      entries_destroy_action
    end







  end

end
