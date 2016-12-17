class AddFieldsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :meta, :boolean
    add_column :accounts, :meta_name, :string, index:true    
  end
end
