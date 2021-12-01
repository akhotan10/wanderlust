class CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]

  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(distinct: true).includes(:country).page(params[:page]).per(10)
  end

  def show; end

  def new
    @city = City.new
  end

  def edit; end

  def create
    @city = City.new(city_params)

    if @city.save
      message = "City was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @city, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: "City was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    message = "City was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to cities_url, notice: message
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :country_id)
  end
end
