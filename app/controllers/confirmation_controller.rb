class ConfirmationsController < Devise::RegistrationsController
def after_confirmation_path_for(resource_name, resource)
		sign_in(resource)
   		solicituds_path # redirect_to is not necessary
	end

end
