class AddCategoryToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :category, :string
  end
end
