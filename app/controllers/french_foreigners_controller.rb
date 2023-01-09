class FrenchForeignersController < ApplicationController

  def index
    @french_foreigners = FrenchForeigner.includes(:country).order("countries.country_fr ASC")
  end

  def show
    
  end

  def new
    @countries = Country.all
    @french_foreigner = FrenchForeigner.new
  end

  def create
    @french_foreigner = FrenchForeigner.new(french_foreigner_param)

    if @french_foreigner.save
      redirect_to french_foreigner_path(@french_foreigner)
    else
      render :new
    end
  end

  private

  def french_foreigner_param
    params.require(:french_foreigner).permit(:year, :nbr_fr, :country_id)
  end
end
