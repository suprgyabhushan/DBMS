class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :agreement, null: false
      t.float :royalty_to_pay, null: false
      t.datetime :end_time, null: false
      t.integer :payment_type, null: false, default: LICENCE_ANNUALLY
      t.references :licencee, polymorphic: true, index: true, null: false
      t.belongs_to :ip, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :licences, [:licencee_id, :licencee_type, :ip_id], unique: true
  end
end
