class Api::V1::ItinerariesController < Api::V1::GraphitiController
  def index
    itineraries = ItineraryResource.all(params)
    respond_with(itineraries)
  end

  def show
    itinerary = ItineraryResource.find(params)
    respond_with(itinerary)
  end

  def create
    itinerary = ItineraryResource.build(params)

    if itinerary.save
      render jsonapi: itinerary, status: 201
    else
      render jsonapi_errors: itinerary
    end
  end

  def update
    itinerary = ItineraryResource.find(params)

    if itinerary.update_attributes
      render jsonapi: itinerary
    else
      render jsonapi_errors: itinerary
    end
  end

  def destroy
    itinerary = ItineraryResource.find(params)

    if itinerary.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: itinerary
    end
  end
end
