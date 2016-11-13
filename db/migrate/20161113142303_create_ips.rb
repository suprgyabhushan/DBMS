class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :title
      t.text :description
      t.string :identify_id
      t.integer :status
      t.string :type
      t.belongs_to :domain, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
