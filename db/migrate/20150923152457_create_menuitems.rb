class CreateMenuitems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :calories
      t.string :img
      t.boolean :available, :default => 1
		
		t.timestamps null: false

	 end
  end
end
