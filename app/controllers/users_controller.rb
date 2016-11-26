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

  def showpIP
      @ips = Ip.all
      render 'dashboard/review'
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
