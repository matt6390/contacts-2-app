require 'unirest'

system 'clear'


puts "Welcome to My Contacts"
puts "=" * 80
puts "     Press [1] For all contacts"
puts "     Press [2] To add a new contact"
puts "     Press [3] To find a specific contact"
puts "     Press [4] to update a contact"
puts "     Press [5] to destroy a contact entry"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/entries")
  entries = response.body
  puts JSON.pretty_generate(entries)

elsif input_option == "2"
    client_params = {}

    print "id: "
    client_params[:id] = gets.chomp

    print "First Name: "
    client_params[:fn] = gets.chomp

    print "Middle Name: "
    client_params[:middle_name] = gets.chomp

    print "Last Name: "
    client_params[:last_name] = gets.chomp

    print "Bio: "
    client_params[:bio] = gets.chomp

    print "Email: "
    client_params[:email] = gets.chomp

    print "Phone Number: "
    client_params[:p_num] = gets.chomp

    response = Unirest.post(
                          "http://localhost:3000/entries",
                          parameters: client_params
                          )
    entry = response.body
    puts JSON.pretty_generate(entry)

elsif input_option == "3"
    print "Which contact would you like to see? (Please enter a number)"
    contact_id = gets.chomp

    response = Unirest.get("http://localhost:3000/entries/#{contact_id}")

    entry = response.body

    puts JSON.pretty_generate(entry)

elsif input_option == "4"
      client_params = {}
      print "Enter the ID of the contact you'd like to update"
      input_id = gets.chomp

    print "id: "
    client_params[:id] = gets.chomp

    print "First Name: "
    client_params[:fn] = gets.chomp

    print "Middle Name: "
    client_params[:middle_name] = gets.chomp

    print "Last Name: "
    client_params[:last_name] = gets.chomp

    print "Bio: "
    client_params[:bio] = gets.chomp

    print "Email: "
    client_params[:email] = gets.chomp

    print "Phone Number: "
    client_params[:p_num] = gets.chomp

      response = Unirest.patch(
                            "http://localhost:3000/entries/#{input_id}",
                            parameters: client_params
                            )
      entry = response.body
      puts JSON.pretty_generate(entry)
elsif input_option == "5"
        print "Enter contact id: "
        input_id = gets.chomp

        response = Unirest.delete("http://localhost:3000/entries/#{input_id}")

        data = response.body
        puts JSON.pretty_generate(data)
end







