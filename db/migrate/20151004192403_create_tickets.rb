class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :table
      t.float :total
      t.float :tax
		t.string :items

      t.timestamps null: false
    end
  end
end
