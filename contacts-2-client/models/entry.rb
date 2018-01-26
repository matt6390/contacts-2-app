class Entry
  attr_accessor :id, :first_name, :last_name, :middle_name, :full_name, :email, :p_num, :created_at, :updated_at
  def initialize(input_options)
    @id = input_options["id"]
    @full_name = input_options["full_name"]
    @last_name = input_options["last_name"]
    @middle_name = input_options["middle_name"]
    @first_name = input_options["first_name"]
    @email = input_options["email"]
    @p_num = input_options["p_num"]
    @created_at = input_options["created_at"]
    @updated_at = input_options["updated_at"]
  end


end