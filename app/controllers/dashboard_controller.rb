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
  end

  def reviewing
    @ips = current_user.ips.where(:status => IP_REVIEWING)
  end

  def rejected
    @ips = current_user.ips.where(:status => IP_REJECTED)
  end
end
