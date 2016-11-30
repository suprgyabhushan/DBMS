class LicencesController < InheritedResources::Base

  private

    def licence_params
      params.require(:licence).permit(:agreement, :royalty_to_pay, :end_time, :payment_type, :licencee_id, :licencee_type, :ip_id)
    end
end

