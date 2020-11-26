class ApplicationController < ActionController::Base
	def admin_check
		if current_user == nil || current_user.admin == false
			redirect_to :root
		end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
	end

	def check_admin
		Rails.logger.info "check_admin"
		initial_user = User.where(admin: true)
		if initial_user == []
			Rails.logger.info "Resetting Admin Permissions"
			user = User.find(1)
			user.update(admin: true)
		end
	end

	def generate_token
		loop do
			token = SecureRandom.hex(4)
			break token unless GameSession.where(passcode: token).exists? && Player.where(passcode: token).exists?
		end
	end
end
