class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  def status
      @user = User.find(params[:id])
      if(@user.status == 0)
        @user.status = 1 # toggle the status
      end
      @user.save
      redirect_to user_path(@user)
  end
  def clear
      @user = User.find(params[:id])
      @users = User.all
      if(@user.royalty_credited > 0)
        @user.royalty_credited = 0 # toggle the status
      end
      @user.save
      redirect_to users_path()
  end

  def showpIP
      @ips = Ip.where(:status => IP_REVIEWING)
      render 'dashboard/review'
  end
  def showaIP
    if params[:ip]
      @ips = Ip.where(:status => IP_ACCEPTED).filter(params[:ip].slice(:domain_id))
    else
      @ips = Ip.where(:status => IP_ACCEPTED)
    end
    render 'dashboard/accept'
  end
  def showr
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
  def showa
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
  def index
    @users = User.all
  end
  def new

  end


end
