class AddAmountToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :int, default: 0
  end
end
