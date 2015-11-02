class CreateIngredientsMenuitems < ActiveRecord::Migration
  def change
    create_table :ingredients_menuitems, :id => false do |t|
		 t.belongs_to :menuitem, index: true
		 t.belongs_to :ingredient, index: true
    end

  end
end
