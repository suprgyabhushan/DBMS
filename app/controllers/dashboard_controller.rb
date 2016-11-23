class DashboardController < ApplicationController
  def index
    @ip = Ip.new
    @users = User.all
    @ip.stakes.build
  end
end
