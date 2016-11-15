class AddRoleToIps < ActiveRecord::Migration
  def change
    add_column :ips, :role, :string
  end
end
