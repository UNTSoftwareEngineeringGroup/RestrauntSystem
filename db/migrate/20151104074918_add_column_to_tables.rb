class AddColumnToTables < ActiveRecord::Migration
  def change
    add_column :tables, :refills, :string
    add_column :tables, :help, :boolean
  end
end
