class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :table
      t.float :total
      t.float :tax
      t.integer :tstatus
      t.boolean :togo

      t.timestamps null: false
    end
  end
end
