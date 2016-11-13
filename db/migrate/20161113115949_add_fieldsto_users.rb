class AddFieldstoUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :royalty_credited, :float
    add_column :users, :royalty_accumulated, :float
    add_column :users, :name, :string
    add_column :users, :type, :string
    add_column :users, :status, :integer
  end
end
