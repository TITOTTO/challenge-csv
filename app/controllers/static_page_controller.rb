class StaticPageController < ApplicationController
  def home
    @countries = Country.all
  end
end