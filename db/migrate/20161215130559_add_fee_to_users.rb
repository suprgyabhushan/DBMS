class AddFeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :charge_fee, :int, default: 0
  end
end
