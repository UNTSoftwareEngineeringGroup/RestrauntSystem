class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.date :expiration
      t.boolean :usable

      t.timestamps null: false
    end
  end
end
