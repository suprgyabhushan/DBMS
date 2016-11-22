ActiveAdmin.register User do

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
  column :email
  column :status
  column "Confirmation" do |user|
    link_to ("Confirm") , status_user_path(user)
  end
  column :created_at
  column :updated_at
  actions
end
controller do
    def status
        user = User.find(params[:id])
        user.status = !user.status # toggle the status
        user.save
        redirect_to user_path(user)
    end
  end
  scope :confirmed_users do |users|
    users.where('status = ?', 1)
  end
  scope :unconfirmed_users do |users|
    users.where('status = ?', 0)
  end




permit_params :status, :user_id

end
