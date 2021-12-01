class EatingListsController < ApplicationController
  before_action :set_eating_list, only: [:show, :edit, :update, :destroy]

  # GET /eating_lists
  def index
    @eating_lists = EatingList.all
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
      redirect_to @eating_list, notice: 'Eating list was successfully created.'
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
    redirect_to eating_lists_url, notice: 'Eating list was successfully destroyed.'
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
