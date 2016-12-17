class AddFieldsToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :decimal
    add_column :transactions, :type_transfer, :boolean
    add_column :transactions, :type_deposit, :boolean
    add_column :transactions, :type_fee, :boolean
    add_column :transactions, :type_withdrawal, :boolean
  end
end
