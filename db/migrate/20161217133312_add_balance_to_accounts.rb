class AddBalanceToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :balance, :int, default: 0
  end
end
