class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
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
