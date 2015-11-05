class AddColumnToGuestaccounts < ActiveRecord::Migration
  def change
    add_column :guestaccounts, :points, :integer
  end
end
