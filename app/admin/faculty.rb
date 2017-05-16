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
  column "Name" do |faculty|
    faculty.user.email
  end
  column :ip_committee do |faculty|
    if faculty.ip_committee == true
      "Yes"
    else
      "No"
    end
  end
  column "Confirmation" do |faculty|
    link_to "Enable", url_for(:action => :enable, :id => faculty.id), :method => :get
  end
  column "Disabling" do |faculty|
    link_to "Disable", url_for(:action => :disable, :id => faculty.id), :method => :get
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
  Ip.where(status: IP_COM_MISSING).each do |ip|
    ip.set_ip_committee
  end
  redirect_to :action => :index
end

member_action :disable, :method => :get do
  faculty = Faculty.find(params[:id])
  ip_comm = Faculty.count(:ip_committee => 1)

  flash[:notice] = "IP Committee has been disabled!"
    faculty.ip_committee = 0
    faculty.save

  redirect_to :action => :index
end
scope :all, :default => true
scope :ip_committee_members do |faculty|
  faculty.where(:ip_committee => 1)
end
permit_params :ip_committee, :user_id

end
