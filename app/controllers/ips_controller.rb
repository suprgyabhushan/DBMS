class IpsController < ApplicationController
  #before_action :set_ip, only: [:show, :edit, :update, :destroy]
  def new
    @ip = Ip.new
  end

  def create
    @ip = current_user.ips.build(ip_params)
   if @ip.save
     flash[:success] = "IP created!"
     redirect_to '/dashboard'
   else
     render '/dashboard'
   end
  end

  def destroy
  end



  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_params
      params.require(:ip).permit(:title, :description, :identify_id, :status, :role, :domain_id, :attachment, stakes_attributes: [:id, :percentage, :user_id, :_destroy])
    end
end
