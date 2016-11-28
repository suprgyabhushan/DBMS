class IpsController < ApplicationController
  #before_action :set_ip, only: [:show, :edit, :update, :destroy]
  def new
    @ip = Ip.new
  end

  def accept
    # if current_user.try?(:faculty)
    @ip = Ip.find(params[:id])
    comm = @ip.ip_comms.where(:faculty_id => current_user.faculty.id).first
    if comm.vote == nil or comm.vote == 0
      comm.vote = 1
    end
    comm.save
    @ip.save
    redirect_to reviewingIP_path
  end


  def reject
    # if current_user.try?(:faculty)
    @ip = Ip.find(params[:id])
    comm = @ip.ip_comms.where(:faculty_id => current_user.faculty.id).first
    if comm.vote == nil or comm.vote == 1
      comm.vote = 0
    end
    comm.save
    @ip.save
    redirect_to reviewingIP_path
  end



  def create
    @ip = current_user.ips.build(ip_params)
    # puts params[:ip][:percentage]
    # @ip.stakes << Stake.new({user_id: current_user.id, percentage: params[:ip][:percentage]})
   if @ip.save
     flash[:success] = "IP created!"
     redirect_to '/dashboard'
   else
     redirect_to '/dashboard'
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
