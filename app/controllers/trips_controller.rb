class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @q = Trip.ransack(params[:q])
    @trips = @q.result(distinct: true).includes(:user, :itineraries,
                                                :eating_lists, :activities, :highlights).page(params[:page]).per(10)
  end

  def show
    @highlight = Highlight.new
    @activity = Activity.new
    @eating_list = EatingList.new
    @itinerary = Itinerary.new
  end

  def new
    @trip = Trip.new
  end

  def edit; end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      message = "Trip was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @trip, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: "Trip was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    message = "Trip was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to trips_url, notice: message
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :user_id,
                                 :cover_photo, :photo_album_link)
  end
end
