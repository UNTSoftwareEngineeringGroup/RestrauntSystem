class AddGratuityToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :gratuity, :float
	 add_column :tickets, :subtotal, :float
  end
end
