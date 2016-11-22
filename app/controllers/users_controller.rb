class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  def status
      @user = User.find(params[:id])
      if(@user.status == 0)
        @user.status = 1 # toggle the status
      end
      @user.save
      redirect_to user_path(@user)
  end
  def showr
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  def showa
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  def index
    @users = User.find(:all)
  end
  def new

  end


end
