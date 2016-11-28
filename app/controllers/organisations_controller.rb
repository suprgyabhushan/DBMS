class OrganisationsController < InheritedResources::Base

  private

    def organisation_params
      params.require(:organisation).permit(:name, :royalty_accumulated, :royalty_credited, :user_id)
    end
end

