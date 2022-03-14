class Api::V1::ArtpiecesController < Api::V1::GraphitiController
  def index
    artpieces = ArtpieceResource.all(params)
    respond_with(artpieces)
  end

  def show
    artpiece = ArtpieceResource.find(params)
    respond_with(artpiece)
  end

  def create
    artpiece = ArtpieceResource.build(params)

    if artpiece.save
      render jsonapi: artpiece, status: 201
    else
      render jsonapi_errors: artpiece
    end
  end

  def update
    artpiece = ArtpieceResource.find(params)

    if artpiece.update_attributes
      render jsonapi: artpiece
    else
      render jsonapi_errors: artpiece
    end
  end

  def destroy
    artpiece = ArtpieceResource.find(params)

    if artpiece.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: artpiece
    end
  end
end
