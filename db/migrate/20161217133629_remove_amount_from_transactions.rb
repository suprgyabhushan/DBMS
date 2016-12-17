class RemoveAmountFromTransactions < ActiveRecord::Migration
  def self.up
  remove_column :transactions, :amount
  end
  def self.down
  add_column :transactions, :amount, :int
  end
end
