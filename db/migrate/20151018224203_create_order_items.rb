class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :item
      t.string :ingredients
      t.string :notes
      t.integer :istatus
      t.references :ticket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
