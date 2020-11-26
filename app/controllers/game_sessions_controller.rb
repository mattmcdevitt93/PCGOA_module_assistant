class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :edit, :update, :destroy]
  after_action :check_admin, only: [:index]

  # GET /game_sessions
  # GET /game_sessions.json
  def index
    @game_sessions = GameSession.all

    if params[:reset] == 'true' and current_user.admin == true
      Rails.logger.info "==================================="
      Rails.logger.info "Redirect Settings - All Sessions reset"
      Rails.logger.info "==================================="
      GameSession.delete_all
      redirect_to game_sessions_path
    end
  end

  def my_sessions
    @game_sessions = GameSession.where(owner: current_user)
  end

  # GET /game_sessions/1
  # GET /game_sessions/1.json
  def show
  end

  # GET /game_sessions/new
  def new
    @game_session = GameSession.new
    # @generated_code = generate_token
    @effect_buffer = 3
    @number_of_players = 4
  end

  # GET /game_sessions/1/edit
  def edit
    @generated_code = @game_session.passcode
    @number_of_players = @game_session.number_of_players
    @effect_buffer = @game_session.effect_buffer
  end

  # POST /game_sessions
  # POST /game_sessions.json
  def create
    params[:game_session][:passcode] = generate_token
    @game_session = GameSession.new(game_session_params)

    Rails.logger.info "Session Create - Players " + @game_session.number_of_players.to_s

    respond_to do |format|
      if @game_session.save
        format.html { redirect_to @game_session, notice: 'Game session was successfully created.' }
        format.json { render :show, status: :created, location: @game_session }
      else
        format.html { render :new }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end

      GameSession.new_session_player(@game_session.id, @game_session.number_of_players)
    
    end
  end

  # PATCH/PUT /game_sessions/1
  # PATCH/PUT /game_sessions/1.json
  def update
    respond_to do |format|
      if @game_session.update(game_session_params)
        format.html { redirect_to @game_session, notice: 'Game session was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_session }
      else
        format.html { render :edit }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sessions/1
  # DELETE /game_sessions/1.json
  def destroy
    @game_session.destroy
    respond_to do |format|
      format.html { redirect_to game_sessions_url, notice: 'Game session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_game_session
      @game_session = GameSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_session_params
      params.require(:game_session).permit(:session_name, :owner, :number_of_players, :effects_used, :passcode, :effect_buffer, :lock_player_pages, :player_display_mode)
    end
end
