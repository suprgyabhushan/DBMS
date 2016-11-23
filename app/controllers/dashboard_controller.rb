class DashboardController < ApplicationController
  def index
    @ip = Ip.new
    @users = User.all
    
  end
end
