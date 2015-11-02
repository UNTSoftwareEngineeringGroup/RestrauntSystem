class AddPriceToMenuitem < ActiveRecord::Migration
  def change
    add_column :menuitems, :price, :float
  end
end
