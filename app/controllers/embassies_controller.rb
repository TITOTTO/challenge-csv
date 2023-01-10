class EmbassiesController < ApplicationController
  before_action :find_embassy, only: %i[show edit destroy update]

  def index
    @embassies = Embassy.all
  end

  def show
  end

  def edit
  end

  def new
    @countries = Country.all
    @embassy = Embassy.new
  end

  def create
    @embassy = Embassy.new(embassy_params)
    @embassy.save
    if @embassy.errors.empty?
      flash[:success] = "Ambassade créé"
      redirect_to embassy_path(@embassy)
    else
      flash[:notice] = embassy_errors
      redirect_to new_embassy_path
    end
  end


  def update
    @embassy.update(embassy_params)
    if @embassy.errors.empty?
      flash[:success] = "Ambassade modifié"
    else
      flash[:notice] = embassy_errors
    end

    redirect_to embassy_path(@embassy)
  end

  def destroy
    @embassy.destroy
    if @embassy.errors.empty?
      flash[:success] = "Ambassade supprimé"
    else
      flash[:notice] = embassy_errors
    end
    redirect_to embassies_path
  end

  private

  def embassy_params
    params.require(:embassy).permit(:building, :latitude, :longitude, :contact, :country_id)
  end

  def find_embassy
    @embassy = Embassy.find(params[:id])
  end

  def embassy_errors
    @errors = []
    @embassy.errors.each {|error| @errors << error.full_message }
    @errors
  end
end