class ArtpiecesController < ApplicationController
  before_action :set_artpiece, only: %i[show edit update destroy]

  def index
    @q = Artpiece.ransack(params[:q])
    @artpieces = @q.result(distinct: true).includes(:artist, :likes,
                                                    :museum).page(params[:page]).per(10)
  end

  def show
    @like = Like.new
  end

  def new
    @artpiece = Artpiece.new
  end

  def edit; end

  def create
    @artpiece = Artpiece.new(artpiece_params)

    if @artpiece.save
      message = "Artpiece was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @artpiece, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @artpiece.update(artpiece_params)
      redirect_to @artpiece, notice: "Artpiece was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @artpiece.destroy
    message = "Artpiece was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to artpieces_url, notice: message
    end
  end

  private

  def set_artpiece
    @artpiece = Artpiece.find(params[:id])
  end

  def artpiece_params
    params.require(:artpiece).permit(:title, :year, :artistic_movement,
                                     :description, :image, :artist_id, :museum_id)
  end
end
