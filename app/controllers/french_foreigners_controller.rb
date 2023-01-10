class FrenchForeignersController < ApplicationController
  before_action :find_french_foreigner, only: %i[show edit destroy update]

  def index
    @french_foreigners = FrenchForeigner.includes(:country).order("countries.country_fr ASC")
  end

  def show
    
  end

  def edit
    
  end

  def new
    @countries = Country.all
    @french_foreigner = FrenchForeigner.new
  end

  def create
    @french_foreigner = FrenchForeigner.new(french_foreigner_params)
    @french_foreigner.save
    if @french_foreigner.errors.empty?
      flash[:success] = "Ambassade créé"
      redirect_to french_foreigner_path(@french_foreigner)
    else
      flash[:notice] = french_foreigner_errors
      redirect_to new_french_foreigner_path
    end
  end


  def update
    @french_foreigner.update(french_foreigner_params)
    if @french_foreigner.errors.empty?
      flash[:success] = "Ambassade modifié"
    else
      flash[:notice] = french_foreigner_errors
    end

    redirect_to french_foreigner_path(@french_foreigner)
  end

  def destroy
    @french_foreigner.destroy
    if @french_foreigner.errors.empty?
      flash[:success] = "Ambassade supprimé"
    else
      flash[:notice] = french_foreigner_errors
    end
    redirect_to french_foreigners_path
  end

  private

  def french_foreigner_params
    params.require(:french_foreigner).permit(:year, :nbr_fr, :country_id)
  end

  def find_french_foreigner
    @french_foreigner = FrenchForeigner.find(params[:id])
  end

  def french_foreigner_errors
    @errors = []
    @french_foreigner.errors.each {|error| @errors << error.full_message }
    @errors
  end
end
