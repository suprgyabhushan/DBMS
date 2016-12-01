ActiveAdmin.register Ip do

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

#index do
#  selectable_column
#  id_column
#  column :title
#  column :description
#  column :created_at
#  column :updated_at
#  column :status
#  column :attachment
#  actions

#end

index do
  column :title, :sortable => :title do |ip|
    link_to ip.title, [:edit_admin, ip]
  end

  # column :stakes do |ip|
  #   table_for ip.stakes do
  #     column do |stake|
  #       link_to stake.user.email, [ :admin, stake ]
  #       end
  #   end
  # end

  column :percentage do |ip|
    table_for ip.stakes do
      column do |stake|
        link_to stake.percentage, [:admin, stake]
    end
  end
end
  actions
end

show do
  attributes_table do
    row :title
    row :description
    table_for ip.stakes do
      column "Stakeholders" do |stake|
        link_to stake.stakeholder.name, [ :admin, stake ]
      end
    end
    table_for ip.stakes do
      column "Stakes Percentage" do |stake|
        link_to stake.percentage, [ :admin, stake ]
      end
    end
  end
end



scope :all, :default => true
scope :pending_ip_assets do |ips|
  ips.where('status = ?', IP_PENDING)
end
scope :reviewing_ip_assets do |ips|
  ips.where('status = ?', IP_REVIEWING)
end
scope :accepted_ip_assets do |ips|
  ips.where('status = ?', IP_ACCEPTED)
end
scope :rejected_ip_assets do |ips|
  ips.where('status = ?', IP_REJECTED)
end
scope :missing_ip_committee do |ips|
  ips.where('status = ?', IP_COM_MISSING)

end


permit_params :title, :description, :status

end
