class MuseumsController < ApplicationController
  before_action :set_museum, only: [:show, :edit, :update, :destroy]

  # GET /museums
  def index
    @museums = Museum.all
  end

  # GET /museums/1
  def show
  end

  # GET /museums/new
  def new
    @museum = Museum.new
  end

  # GET /museums/1/edit
  def edit
  end

  # POST /museums
  def create
    @museum = Museum.new(museum_params)

    if @museum.save
      redirect_to @museum, notice: 'Museum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /museums/1
  def update
    if @museum.update(museum_params)
      redirect_to @museum, notice: 'Museum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /museums/1
  def destroy
    @museum.destroy
    redirect_to museums_url, notice: 'Museum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_museum
      @museum = Museum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def museum_params
      params.require(:museum).permit(:name, :location, :description)
    end
end
