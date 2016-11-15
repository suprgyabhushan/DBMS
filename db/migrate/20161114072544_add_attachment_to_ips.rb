class AddAttachmentToIps < ActiveRecord::Migration
  def change
    add_column :ips, :attachment, :string
  end
end
