class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.float :royalty_accumulated
      t.float :royalty_credited
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
