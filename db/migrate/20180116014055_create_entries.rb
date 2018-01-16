class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :fn
      t.string :ln
      t.string :email
      t.string :p_num

      t.timestamps
    end
  end
end
