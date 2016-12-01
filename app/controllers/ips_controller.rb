class IpsController < ApplicationController
  #before_action :set_ip, only: [:show, :edit, :update, :destroy]
  before_filter :allow_ip_comm, only: [:accept, :reject]

  def index
    if params[:ip]
      @ips = Ip.where(:status => IP_ACCEPTED).filter(params[:ip].slice(:domain_id))
    else
      @ips = Ip.where(:status => IP_ACCEPTED)
    end
  end

  def new
    @ip = Ip.new
    @ip.stakes.build(stakeholder: Organisation.first, percentage: 20)
    @ip.stakes.build(stakeholder: current_user)
  end

  def accept
    # if current_user.try?(:faculty)
    @ip = Ip.find(params[:id])
    comm = @ip.ip_comms.where(:faculty_id => current_user.faculty.id).first
    if (comm.vote == nil or comm.vote == IP_PENDING or comm.vote == IP_REVIEWING or comm.vote == IP_REJECTED)
      comm.vote = IP_ACCEPTED
    end
    comm.save
    @ip.save!
    redirect_to reviewingIP_path
  end


  def reject
    # if current_user.try?(:faculty)
    @ip = Ip.find(params[:id])
    comm = @ip.ip_comms.where(:faculty_id => current_user.faculty.id).first
    if comm.vote == nil or comm.vote == IP_ACCEPTED
      comm.vote = IP_REJECTED
    end
    comm.save
    @ip.save
    redirect_to reviewingIP_path
  end

  def create
    @ip = Ip.new(ip_params)

    respond_to do |format|
      if @ip.save!
        format.html { redirect_to @ip, notice: 'IP was successfully created.' }
        format.json { render :show, status: :created, location: @ip }
      else
        format.html { render :new }
        format.json { render json: @ip.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @ip = Ip.find(params[:id])
  end

  def edit
    @ip = Ip.find(params[:id])
  end

  def destroy
  end

  private

    def allow_ip_comm
      unless current_user.faculty and current_user.faculty.ip_committee == true
        flash[:notice] = "You don't have enough permissions"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_params
      params.require(:ip).permit(:title, :description, :identify_id, :status, :role, :domain_id, :attachment, stakes_attributes: [:id, :percentage, :stakeholder_type, :stakeholder_id, :_destroy])
    end
end
