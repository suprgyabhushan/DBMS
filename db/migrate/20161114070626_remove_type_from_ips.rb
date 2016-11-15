class RemoveTypeFromIps < ActiveRecord::Migration
  def self.up
    remove_column :ips, :type
  end
  def self.down
    add_column :ips, :type
  end
end
