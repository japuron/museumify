class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update destroy]

  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).includes(:artpieces,
                                                  :exhibitions).page(params[:page]).per(10)
  end

  def show
    @artpiece = Artpiece.new
  end

  def new
    @artist = Artist.new
  end

  def edit; end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist, notice: "Artist was successfully created."
    else
      render :new
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: "Artist was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url, notice: "Artist was successfully destroyed."
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :dob_year, :biography)
  end
end
