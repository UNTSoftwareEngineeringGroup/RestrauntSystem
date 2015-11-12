class CreateTotaltickets < ActiveRecord::Migration
  def change
    create_table :totaltickets do |t|
      t.integer :total

      t.timestamps null: false
    end
  end
end
