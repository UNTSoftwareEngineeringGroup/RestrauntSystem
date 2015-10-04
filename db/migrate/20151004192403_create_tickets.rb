class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :table
      t.integer :orderItem
      t.float :total
      t.float :tax

      t.timestamps null: false
    end
  end
end
