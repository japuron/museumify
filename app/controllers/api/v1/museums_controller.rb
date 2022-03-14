class Api::V1::MuseumsController < Api::V1::GraphitiController
  def index
    museums = MuseumResource.all(params)
    respond_with(museums)
  end

  def show
    museum = MuseumResource.find(params)
    respond_with(museum)
  end

  def create
    museum = MuseumResource.build(params)

    if museum.save
      render jsonapi: museum, status: 201
    else
      render jsonapi_errors: museum
    end
  end

  def update
    museum = MuseumResource.find(params)

    if museum.update_attributes
      render jsonapi: museum
    else
      render jsonapi_errors: museum
    end
  end

  def destroy
    museum = MuseumResource.find(params)

    if museum.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: museum
    end
  end
end
