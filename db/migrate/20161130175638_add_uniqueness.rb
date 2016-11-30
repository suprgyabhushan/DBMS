class AddUniqueness < ActiveRecord::Migration
  def change
    change_column_null :students, :rollNumber, false
    add_index :students, :rollNumber, unique: true

    change_column_null :faculties, :emp_id, false
    add_index :faculties, :emp_id, unique: true

    change_column_null :domains, :name, false
    add_index :domains, :name, unique: true

    change_column_null :organisations, :name, false
    add_index :organisations, :name, unique: true

    change_column_null :ips, :title, false
    change_column_null :ips, :description, false
    change_column_null :ips, :attachment, false
    add_index :ips, [:title, :attachment], unique: true

    change_column_null :stakes, :ip_id, false
    change_column_null :stakes, :stakeholder_id, false
    change_column_null :stakes, :stakeholder_type, false
    add_index :stakes, [:stakeholder_id, :stakeholder_type, :ip_id], unique: true

    change_column_null :ip_comms, :ip_id, false
    change_column_null :ip_comms, :faculty_id, false
    add_index :ip_comms, [:faculty_id, :ip_id], unique: true
  end
end
