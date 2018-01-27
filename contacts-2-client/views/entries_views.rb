module EntriesView

  def entries_show_view(entry)
    puts
    puts "#{entry.first_name} - Contact ID: #{entry.id}"
    puts "-" * 50
    puts
    puts entry.full_name
    puts 
    puts entry.email
    puts entry.p_num



    
  end

  def entries_index_view(entries)
    entries.each do |entry|
      puts "=" * 50 
      entries_show_view(entry)
    end
  end

end