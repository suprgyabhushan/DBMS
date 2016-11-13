class CreateIpComms < ActiveRecord::Migration
  def change
    create_table :ip_comms do |t|
      t.integer :vote
      t.text :comment
      t.belongs_to :faculty, index: true, foreign_key: true
      t.belongs_to :ip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
