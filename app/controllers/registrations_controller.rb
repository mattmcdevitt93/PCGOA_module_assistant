class RegistrationsController < Devise::RegistrationsController 
	after_action :check_admin, only: [:create]
    # Use callbacks to share common setup or constraints between actions.
end