class AddBioToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :bio, :text
  end
end
