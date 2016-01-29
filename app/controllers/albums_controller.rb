class AlbumsController < ApplicationController

  def new
    @album = Album.new(band_id: params[:band_id].to_i)
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end

  def edit

  end

  def update

  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to albums_url
    else
      redirect_to edit_album_url
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :live)
  end
end
