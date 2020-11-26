class WandsController < ApplicationController
  before_action :set_wand, only: [:show, :edit, :update, :destroy]
  before_action :admin_check, only: [:index, :show, :edit, :update, :destroy]

  # GET /wands
  # GET /wands.json
  def index
    @wands = Wand.all

    if params[:reset] == 'true' and current_user.admin == true
      Rails.logger.info "==================================="
      Rails.logger.info "Redirect Settings - All Wands reset"
      Rails.logger.info "==================================="
      Wand.delete_all
      redirect_to wands_path
    end
  end

  # GET /wands/1
  # GET /wands/1.json
  def show
  end

  # GET /wands/new
  def new
    if params.has_key?(:s)
      @game_session_id = GameSession.find(params[:s])
      @effects = Effect.random_records(@game_session_id.effect_buffer)
      @durations = Duration.random_records(@game_session_id.effect_buffer)
      @players = Player.where(session_id: @game_session_id.id)
    end
    @wand = Wand.new
  end

  # GET /wands/1/edit
  def edit
  end

  # POST /wands
  # POST /wands.json
  def create
    @wand = Wand.new(wand_params)
    @wand.effect = Effect.find(wand_params[:effect_id].to_i).effect.to_s
    @wand.duration = Duration.find(wand_params[:duration].to_i).duration.to_s
    respond_to do |format|
      if @wand.save
        format.html { redirect_to request.referrer, notice: 'Wand was successfully created.' }
        format.json { render :show, status: :created, location: @wand }
      else
        format.html { render :new }
        format.json { render json: @wand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wands/1
  # PATCH/PUT /wands/1.json
  def update
    respond_to do |format|
      if @wand.update(wand_params)
        format.html { redirect_to request.referrer, notice: 'Wand was successfully updated.' }
        format.json { render :show, status: :ok, location: @wand }
      else
        format.html { render :edit }
        format.json { render json: @wand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wands/1
  # DELETE /wands/1.json
  def destroy
    @wand.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Wand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wand
      @wand = Wand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wand_params
      params.require(:wand).permit(:session_id, :uses_count, :effect_id, :player_id, :effect, :duration, :description)
    end
end
