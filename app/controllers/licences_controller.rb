class LicencesController < InheritedResources::Base

  def new
    if current_user.admin == true
      @ips = Ip.where(:status => IP_ACCEPTED)
    else
      @ips = current_user.ips.where(:status => IP_ACCEPTED)
      current_user.organisations.each do |s|
        @ips.merge(s.ips.where(:status => IP_ACCEPTED))
      end
    end
    if params[:id]
      @licence = Licence.new(:ip_id => params[:id])
    else
      @licence = Licence.new
    end
  end

  private

    def licence_params
      params.require(:licence).permit(:agreement, :royalty_to_pay, :end_time, :payment_type, :licencee_id, :licencee_type, :ip_id)
    end
end
