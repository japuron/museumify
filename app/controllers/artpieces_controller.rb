class ArtpiecesController < ApplicationController
  before_action :set_artpiece, only: [:show, :edit, :update, :destroy]

  # GET /artpieces
  def index
    @artpieces = Artpiece.all
  end

  # GET /artpieces/1
  def show
  end

  # GET /artpieces/new
  def new
    @artpiece = Artpiece.new
  end

  # GET /artpieces/1/edit
  def edit
  end

  # POST /artpieces
  def create
    @artpiece = Artpiece.new(artpiece_params)

    if @artpiece.save
      redirect_to @artpiece, notice: 'Artpiece was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /artpieces/1
  def update
    if @artpiece.update(artpiece_params)
      redirect_to @artpiece, notice: 'Artpiece was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artpieces/1
  def destroy
    @artpiece.destroy
    message = "Artpiece was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to artpieces_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artpiece
      @artpiece = Artpiece.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artpiece_params
      params.require(:artpiece).permit(:title, :year, :artistic_movement, :description, :image, :artist_id, :museum_id)
    end
end
