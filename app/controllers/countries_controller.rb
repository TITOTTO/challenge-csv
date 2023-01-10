class CountriesController < ApplicationController
  before_action :find_country, only: %i[show edit destroy update]

  def index
    @countries = Country.all.order(country_fr: :asc)
  end

  def show
  end

  def edit
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    @country.save
    if @country.errors.empty?
      flash[:success] = "Pays créé"
      redirect_to country_path(@country)
    else
      flash[:notice] = country_errors
      redirect_to new_country_path
    end
  end


  def update
    @country.update(country_params)
    if @country.errors.empty?
      flash[:success] = "Pays modifié"
    else
      flash[:notice] = country_errors
    end

    redirect_to country_path(@country)
  end

  def destroy
    @country.destroy
    if @country.errors.empty?
      flash[:success] = "Pays supprimé"
    else
      flash[:notice] = country_errors
    end
    redirect_to countries_path
  end

  private

  def country_params
    params.require(:country).permit(:country_fr, :country_en, :iso_numerical, :iso_alpha2, :iso_alpha3)
  end

  def find_country
    @country = Country.find(params[:id])
  end

  def country_errors
    @errors = []
    @country.errors.each {|error| @errors << error.full_message }
    @errors
  end
end