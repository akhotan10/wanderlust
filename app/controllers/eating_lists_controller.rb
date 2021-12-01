class EatingListsController < ApplicationController
  before_action :set_eating_list, only: [:show, :edit, :update, :destroy]

  # GET /eating_lists
  def index
    @eating_lists = EatingList.page(params[:page]).per(10)
  end

  # GET /eating_lists/1
  def show
  end

  # GET /eating_lists/new
  def new
    @eating_list = EatingList.new
  end

  # GET /eating_lists/1/edit
  def edit
  end

  # POST /eating_lists
  def create
    @eating_list = EatingList.new(eating_list_params)

    if @eating_list.save
      message = 'EatingList was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @eating_list, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /eating_lists/1
  def update
    if @eating_list.update(eating_list_params)
      redirect_to @eating_list, notice: 'Eating list was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /eating_lists/1
  def destroy
    @eating_list.destroy
    message = "EatingList was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to eating_lists_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eating_list
      @eating_list = EatingList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def eating_list_params
      params.require(:eating_list).permit(:trip_id, :restaurant_id)
    end
end
