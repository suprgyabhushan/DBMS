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

controller do
    def scoped_collection
      super.includes :ip
    end
  end


index do
  selectable_column
  column :vote
  column :ip_id
  column "Faculty" do |f|
   usr = Faculty.find(f.faculty_id).user.email
   link_to usr, admin_faculty_path(f.faculty_id)
  end
  actions
end
scope :all, :default => true
scope :missing do |scope|
  scope.where ips: {status: 3}
end



permit_params :vote, :faculty, :ip, :comment
end
