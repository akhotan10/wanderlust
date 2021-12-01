class Api::V1::HighlightsController < Api::V1::GraphitiController
  def index
    highlights = HighlightResource.all(params)
    respond_with(highlights)
  end

  def show
    highlight = HighlightResource.find(params)
    respond_with(highlight)
  end

  def create
    highlight = HighlightResource.build(params)

    if highlight.save
      render jsonapi: highlight, status: 201
    else
      render jsonapi_errors: highlight
    end
  end

  def update
    highlight = HighlightResource.find(params)

    if highlight.update_attributes
      render jsonapi: highlight
    else
      render jsonapi_errors: highlight
    end
  end

  def destroy
    highlight = HighlightResource.find(params)

    if highlight.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: highlight
    end
  end
end
