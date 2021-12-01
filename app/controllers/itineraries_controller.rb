class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

  # GET /itineraries
  def index
    @q = Itinerary.ransack(params[:q])
    @itineraries = @q.result(:distinct => true).includes(:trip, :country).page(params[:page]).per(10)
  end

  # GET /itineraries/1
  def show
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries
  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      message = 'Itinerary was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @itinerary, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /itineraries/1
  def update
    if @itinerary.update(itinerary_params)
      redirect_to @itinerary, notice: 'Itinerary was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /itineraries/1
  def destroy
    @itinerary.destroy
    message = "Itinerary was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to itineraries_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def itinerary_params
      params.require(:itinerary).permit(:country_id, :trip_id)
    end
end
