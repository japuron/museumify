class MuseumsController < ApplicationController
  before_action :set_museum, only: %i[show edit update destroy]

  def index
    @q = Museum.ransack(params[:q])
    @museums = @q.result(distinct: true).includes(:artpieces,
                                                  :exhibited_artists).page(params[:page]).per(10)
  end

  def show
    @artpiece = Artpiece.new
  end

  def new
    @museum = Museum.new
  end

  def edit; end

  def create
    @museum = Museum.new(museum_params)

    if @museum.save
      redirect_to @museum, notice: "Museum was successfully created."
    else
      render :new
    end
  end

  def update
    if @museum.update(museum_params)
      redirect_to @museum, notice: "Museum was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @museum.destroy
    redirect_to museums_url, notice: "Museum was successfully destroyed."
  end

  private

  def set_museum
    @museum = Museum.find(params[:id])
  end

  def museum_params
    params.require(:museum).permit(:name, :location, :description)
  end
end
