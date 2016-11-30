class DashboardController < ApplicationController
  def index
    @ip = Ip.new
    @ip.stakes.build(stakeholder_id: current_user.id)
    @ip.stakes.build(stakeholder_id: Organisation.first.id)
    # @ip.stakes.first.user_id = current_user.id
  end

  def accepted
    if params[:ip]
      @ips = current_user.ips.where(:status => IP_ACCEPTED).filter(params[:ip].slice(:domain_id))
    else
      @ips = current_user.ips.where(:status => IP_ACCEPTED)
    end
  end

  def pending
    if params[:ip]
      @ips = current_user.ips.where(:status => [IP_COM_MISSING,IP_PENDING]).filter(params[:ip].slice(:domain_id))
    else
      @ips = current_user.ips.where(:status => [IP_COM_MISSING,IP_PENDING])
    end
  end

  def reviewing
    if params[:ip]
      @ips = current_user.ips.where(:status => IP_REVIEWING).filter(params[:ip].slice(:domain_id))
    else
      @ips = current_user.ips.where(:status => IP_REVIEWING)
    end
  end

  def rejected
    if params[:ip]
      @ips = current_user.ips.where(:status => IP_REJECTED).filter(params[:ip].slice(:domain_id))
    else
      @ips = current_user.ips.where(:status => IP_REJECTED)
    end
  end
end
