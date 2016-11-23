ActiveAdmin.register IpComm do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :vote
  column :ip_id
  column :faculty_id
  column :comment
  actions
end
scope :all, :default => true
scope :conflicting_ip_assets do |ip_comms|
  ip_comms.where('vote = ?', 1)
end

permit_params :vote, :faculty, :ip, :comment
end
