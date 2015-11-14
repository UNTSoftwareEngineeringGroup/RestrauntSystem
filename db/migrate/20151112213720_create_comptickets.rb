class CreateComptickets < ActiveRecord::Migration
  def change
    create_table :comptickets do |t|
      t.string :user
      t.string :reason
      t.float :amount

      t.timestamps null: false
    end
  end
end
