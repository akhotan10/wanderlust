class HighlightsController < ApplicationController
  before_action :set_highlight, only: %i[show edit update destroy]

  def index
    @q = Highlight.ransack(params[:q])
    @highlights = @q.result(distinct: true).includes(:trip).page(params[:page]).per(10)
  end

  def show; end

  def new
    @highlight = Highlight.new
  end

  def edit; end

  def create
    @highlight = Highlight.new(highlight_params)

    if @highlight.save
      message = "Highlight was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @highlight, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @highlight.update(highlight_params)
      redirect_to @highlight, notice: "Highlight was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @highlight.destroy
    message = "Highlight was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to highlights_url, notice: message
    end
  end

  private

  def set_highlight
    @highlight = Highlight.find(params[:id])
  end

  def highlight_params
    params.require(:highlight).permit(:description, :trip_id)
  end
end
