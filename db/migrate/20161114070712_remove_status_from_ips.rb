class RemoveStatusFromIps < ActiveRecord::Migration
  def self.up
    remove_column :ips, :status
  end
  def self.down
    add_column :ips, :status
  end
end
