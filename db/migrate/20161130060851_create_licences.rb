class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :agreement
      t.float :royalty_to_pay
      t.datetime :end_time
      t.integer :payment_type
      t.references :licencee, polymorphic: true, index: true
      t.belongs_to :ip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
