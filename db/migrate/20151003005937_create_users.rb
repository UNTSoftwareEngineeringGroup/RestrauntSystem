class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :username
      t.integer :accesslevel

      t.timestamps null: false
    end
  end
end
