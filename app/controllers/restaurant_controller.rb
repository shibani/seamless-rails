class RestaurantController < ApplicationController

  def index
    @restaurants = ::Restaurant.all

    if params[:search]

      #use .length with geocoder, not .size or .count
      #@search_location = Geocoder.coordinates(params[:search])
      #Rails.logger.debug "check " + @restaurants.length.to_s.inspect

      @restaurants = Restaurant.near(params[:search], 1)
      
    end

    render :partial => '/restaurant/index.json', :formats => [:json], :locals =>  { restaurants: @restaurants}
  end

  def show
    @restaurant = Restaurant.find_by(name: params[:name])

    render :partial => '/restaurant/show.json', :formats => [:json], :locals =>  { restaurant: @restaurant}
  end

end
