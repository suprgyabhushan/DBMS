class DashboardController < ApplicationController
  def index
    @ip = Ip.new
    @ip.stakes.build
  end

  def accepted
    @ips = current_user.ips.where(:status => IP_ACCEPTED)
  end

  def pending
    @ips = current_user.ips.where(:status => IP_PENDING)
    render 'dashboard/accepted'
  end

  def reviewing
    @ips = current_user.ips.where(:status => IP_REVIEWING)
    render 'dashboard/accepted'
  end

  def rejected
    @ips = current_user.ips.where(:status => IP_REJECTED)
    render 'dashboard/accepted'
  end
end
