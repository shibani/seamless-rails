class SiteController < ApplicationController
  def search
  end

  def index
    @restaurants = Restaurant.all

    render :partial => '/site/index.json', :formats => [:json], :locals =>  { restaurants: @restaurants}
  end

  def show
  end

  def create
  end
end
