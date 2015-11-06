class AddColumnToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :birthday, :boolean
    add_column :tickets, :coupon, :boolean
	 add_column :tickets, :points, :boolean
  end
end
