class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)

    if @song.valid?
      @song.save

      redirect_to song_path(@song)
    else

      render :new
    end

  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(songs_params)

      redirect_to song_path(@song)
    else

      render edit_song(@song)
    end
  end

  def destroy

  end

  private

  def songs_params
    params.require(:song).permit!
  end

end
