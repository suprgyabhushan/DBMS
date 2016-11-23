class DashboardController < ApplicationController
  def index
    @ip = Ip.new
  end
end
