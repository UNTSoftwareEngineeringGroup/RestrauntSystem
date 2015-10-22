class AddPasswordDigestToGuestaccounts < ActiveRecord::Migration
  def change
  
	add_column :guestaccounts, :password_digest, :string
  end
end
