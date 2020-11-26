class GameSession < ApplicationRecord

	def self.new_session_player(session_id, number_of_players)
		    Rails.logger.info "Players Create" + session_id.to_s + " | " + number_of_players.to_s
			for a in 1..number_of_players do
				Rails.logger.info a.to_s
				Player.create(:name => "Unnamed Player_" + rand(100).to_s, :session_id => session_id.to_i, :status => "1", :unique_link => generate_unique_secure_token)
			end
	end

end
