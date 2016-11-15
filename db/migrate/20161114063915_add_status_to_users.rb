class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :int, default: 0
  end
end
