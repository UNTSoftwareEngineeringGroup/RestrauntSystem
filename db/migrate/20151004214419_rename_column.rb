class RenameColumn < ActiveRecord::Migration
  def change
	  rename_column :Tables, :usernmae, :username
  end
end
