class TracksController < ApplicationController

  def new
    @track = Track.new(album_id: params[:album_id].to_i)
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def edit

  end

  def update

  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      redirect_to tracks_url
    else
      redirect_to edit_track_url
    end
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :bonus)
  end
end
