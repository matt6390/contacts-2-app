class Entry < ApplicationRecord

  def friendly_full_name
    "#{fn} #{middle_name} #{ln}".titleize   #this will work the same way as before, even though we are not setting a variable to anything, since the method will still be returning a value when it ends
  end

  def friendly_created_at
    created_at.strftime("%m-%e-%y, %H:%M")
  end

  def friendly_updated_at
    updated_at.strftime("%m-%e-%y, %H:%M")
  end

  def japanese_numbers
    "+81 (#{p_num})"  #returns this line, without having to set it to a variable, and then returning the variable
  end


  def as_json
      {
        id: id,
        full_name:  friendly_full_name,
        middle_name: middle_name,
        first_name: fn,
        last_name: ln,
        email: email,
        p_num: japanese_numbers,
        created_at: friendly_created_at,
        updated_at: friendly_updated_at
      }
  end
    
end
