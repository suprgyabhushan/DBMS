class AddStatusToIps < ActiveRecord::Migration
  def change
    add_column :ips, :status, :int, default: 0
  end
end
