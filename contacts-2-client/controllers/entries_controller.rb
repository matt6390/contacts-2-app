module EntriesController

  def entries_index_action
    response = Unirest.get("http://localhost:3000/entries")
    entry_hashs = response.body
    entries = [ ]

    entry_hashs.each do |entry_hash|
      entries << Entry.new(entry_hash)
    end
      

  end

  def entries_create_action
    client_params = {}

    print "id: "
    client_params[:id] = gets.chomp

    print "First Name: "
    client_params[:first_name] = gets.chomp

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
    if response.code == 200
      entry = response.body
      puts JSON.pretty_generate(entry)
    else
      errors = response.body
      errors.each do |error|
        p error 
      end
    end
  end

  def entries_show_action
    print "Which contact would you like to see? (Please enter a number): "
    contact_id = gets.chomp

    response = Unirest.get("http://localhost:3000/entries/#{contact_id}")

    entry = response.body

    puts JSON.pretty_generate(entry)
  end

  def entries_update_action
    client_params = {}
    print "Enter the ID of the contact you'd like to update"
    input_id = gets.chomp

    print "id: "
    client_params[:id] = gets.chomp

    print "First Name: "
    client_params[:first_name] = gets.chomp

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
      if response.code == 200
        entry = response.body
        puts JSON.pretty_generate(entry)
      else
        errors = response.body
        errors.each do |error|
          p error 
        end
      end
  end

  def entries_destroy_action
    print "Enter contact id: "
    input_id = gets.chomp

    response = Unirest.delete("http://localhost:3000/entries/#{input_id}")

    data = response.body
    puts JSON.pretty_generate(data)
  end


end