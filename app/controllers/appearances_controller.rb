class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:edit, :update]
  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if logged_in?
      @appearance.user_id = current_user.id
    end
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path, notice: @appearance.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @appearance.update( appearance_params )
      redirect_to @appearance.episode
    else
      redirect_to edit_appearance_path, notice: @appearance.errors.full_messages
    end
  end

  private

  def set_appearance
    @appearance = Appearance.find( params[:id] )
  end

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
