class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :emp_id
      t.boolean :ip_committee
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
