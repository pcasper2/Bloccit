class SummariesController < ApplicationController
  def new
    @summary = Summary.new
    authorize @summary
  end

  def index
    @summaries = Summary.all
    authorize @summaries
  end

  def show
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:name, :description))
    authorize @summary
    if @summary.save
      redirect_to @summary, notice: "Summary was saved successfully!"
    else
      flash[:error] = "Error creating summary. Please try again"
      render :new
    end
  end

end
