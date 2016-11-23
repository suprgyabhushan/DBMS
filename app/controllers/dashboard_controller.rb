class DashboardController < ApplicationController
  def index
    @ip = Ip.new
    @ip.stakes.build
  end
end
