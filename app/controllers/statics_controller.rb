class StaticsController < ApplicationController
	after_action :check_admin, only: [:user_settings]
	before_action :admin_check, only: [:user_settings]
	before_action :set_game_session, only: [:dm_page]

	def dashboard
	end

	def user_settings
		@users = User.all
	end

	def player_page
		@player = Player.where(unique_link: params[:p]).first
		@game_session = GameSession.find(@player.session_id)
		@wands = Wand.where(session_id: @game_session.id, player_id: @player.id).order(:id)
	end

	def dm_page

		@effects = Effect.random_records(@game_session_id.effect_buffer)
		@durations = Duration.random_records(@game_session_id.effect_buffer)
		@wand = Wand.new

		@description = Wand.generate_description()

		@players = Player.where(session_id: @game_session_id.id).order(:id)

		@players.each do |player|
			Rails.logger.info player.id.to_s + " | " + player.name.to_s + " | " + player.unique_link.to_s
			player_link_name = instance_variable_set("@#{"_" + player.unique_link.to_s}", Array.new)
			@wands = Wand.where(session_id: @game_session_id.id, player_id: player.id).order(:id)

			@wands.each do |wand|
				Rails.logger.info "Wand: " + wand.id.to_s + " | " + wand.effect.to_s
				player_link_name.push([wand.id, wand.uses_count, wand.effect_id, wand.effect, wand.duration, wand.description])
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_game_session
		@game_session_id = GameSession.find(params[:id])
	end
end
