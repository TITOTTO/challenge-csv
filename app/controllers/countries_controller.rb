class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to country_path(@country)
    else
      render :new
    end
  end

  private

  def country_params
    params.require(:country).permit(:country_fr, :country_en, :iso_numerical, :iso_alpha2, :iso_alpha3)
  end
end