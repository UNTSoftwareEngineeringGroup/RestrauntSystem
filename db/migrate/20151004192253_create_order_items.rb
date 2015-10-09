class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :item
      t.string :ingredients
      t.string :notes

      t.timestamps null: false
    end
  end
end
