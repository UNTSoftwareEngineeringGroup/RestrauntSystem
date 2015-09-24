class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.integer :calories
      t.string :img
      t.text :ingredients
		t.boolean :available

      t.timestamps null: false
    end
  end
end
