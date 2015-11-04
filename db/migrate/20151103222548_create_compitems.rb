class CreateCompitems < ActiveRecord::Migration
  def change
    create_table :compitems do |t|
      t.string :user
      t.string :reason
      t.float :amount

      t.timestamps null: false
    end
  end
end
