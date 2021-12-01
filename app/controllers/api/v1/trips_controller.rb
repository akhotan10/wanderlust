class Api::V1::TripsController < Api::V1::GraphitiController
  def index
    trips = TripResource.all(params)
    respond_with(trips)
  end

  def show
    trip = TripResource.find(params)
    respond_with(trip)
  end

  def create
    trip = TripResource.build(params)

    if trip.save
      render jsonapi: trip, status: 201
    else
      render jsonapi_errors: trip
    end
  end

  def update
    trip = TripResource.find(params)

    if trip.update_attributes
      render jsonapi: trip
    else
      render jsonapi_errors: trip
    end
  end

  def destroy
    trip = TripResource.find(params)

    if trip.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: trip
    end
  end
end
