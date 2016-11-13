class CreateStakes < ActiveRecord::Migration
  def change
    create_table :stakes do |t|
      t.float :percentage
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :ip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
