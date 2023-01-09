class EmbassiesController < ApplicationController
  def index
    @embassies = Embassy.all
  end

  def show
    @embassy = Embassy.find(params[:id])
  end

  def new
    @countries = Country.all
    @embassy = Embassy.new
  end

  def create
    @embassy = Embassy.new(embassy_params)  

    if @embassy.save
      redirect_to embassy_path(@embassy)
    else
      render :new
    end
  end

  private

  def embassy_params
    params.require(:embassy).permit(:building, :latitude, :longitude, :contact, :country_id)
  end
end