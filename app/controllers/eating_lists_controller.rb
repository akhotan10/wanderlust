class EatingListsController < ApplicationController
  before_action :set_eating_list, only: %i[show edit update destroy]

  def index
    @q = EatingList.ransack(params[:q])
    @eating_lists = @q.result(distinct: true).includes(:trip,
                                                       :restaurant).page(params[:page]).per(10)
  end

  def show; end

  def new
    @eating_list = EatingList.new
  end

  def edit; end

  def create
    @eating_list = EatingList.new(eating_list_params)

    if @eating_list.save
      message = "EatingList was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @eating_list, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @eating_list.update(eating_list_params)
      redirect_to @eating_list, notice: "Eating list was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @eating_list.destroy
    message = "EatingList was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to eating_lists_url, notice: message
    end
  end

  private

  def set_eating_list
    @eating_list = EatingList.find(params[:id])
  end

  def eating_list_params
    params.require(:eating_list).permit(:trip_id, :restaurant_id)
  end
end
