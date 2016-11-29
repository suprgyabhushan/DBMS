class PolymorphicStakes < ActiveRecord::Migration
  def change
    rename_column :stakes, :user_id, :stakeholder_id
    add_column :stakes, :stakeholder_type, :string, after: :id
  end
end
