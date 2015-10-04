class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
 		 t.string :password
		 t.string :username
		 t.integer :accesslevel
		 t.integer :ticket

      t.timestamps null: false
    end
  end
end
