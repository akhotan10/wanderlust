class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[show edit update destroy]

  def index
    @q = Itinerary.ransack(params[:q])
    @itineraries = @q.result(distinct: true).includes(:trip,
                                                      :country).page(params[:page]).per(10)
  end

  def show; end

  def new
    @itinerary = Itinerary.new
  end

  def edit; end

  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      message = "Itinerary was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @itinerary, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @itinerary.update(itinerary_params)
      redirect_to @itinerary, notice: "Itinerary was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @itinerary.destroy
    message = "Itinerary was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to itineraries_url, notice: message
    end
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:country_id, :trip_id)
  end
end
