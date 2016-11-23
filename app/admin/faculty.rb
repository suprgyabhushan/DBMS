ActiveAdmin.register Faculty do

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
  column :emp_id
  column :ip_committee
  column "Confirmation" do |faculty|
    link_to "Enable", url_for(:action => :enable, :id => faculty.id), :method => :get
  end
end

member_action :enable, :method => :get do
  faculty = Faculty.find(params[:id])
  ip_comm = Faculty.count(:ip_committee => 1)

  if(ip_comm > 3)
    flash[:notice] = "IP Committee is full!!"
  else
    flash[:notice] = "IP Committee has been enabled!"
    faculty.ip_committee = 1
    faculty.save
  end
  redirect_to :action => :index
end



permit_params :ip_committee, :user_id

end
