class DashboardController < ApplicationController
  def index
    @ip = Ip.new
    @ip.stakes.build(stakeholder_id: current_user.id)
    @ip.stakes.build(stakeholder_id: current_user.organisations.first.id)
    # @ip.stakes.first.user_id = current_user.id
  end

  def accepted
    @ips = current_user.ips.where(:status => IP_ACCEPTED)
  end

  def pending
    @ips = current_user.ips.where(:status => [IP_COM_MISSING,IP_PENDING])
  end

  def reviewing
    @ips = current_user.ips.where(:status => IP_REVIEWING)
  end

  def rejected
    @ips = current_user.ips.where(:status => IP_REJECTED)
  end
end
