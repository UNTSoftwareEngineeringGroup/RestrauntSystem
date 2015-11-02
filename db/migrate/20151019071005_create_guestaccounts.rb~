class CreateGuestaccounts < ActiveRecord::Migration
  def change
    create_table :guestaccounts do |t|

	t.string :email
	t.string :password
	t.date    :birthday
	
      t.timestamps null: false
    end
  end
end
