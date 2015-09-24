class AddAvailableToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :available, :boolean
  end
end
