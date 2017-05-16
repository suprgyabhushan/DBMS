class AddUserIdToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :user, index: true, foreign_key: true
  end
end
