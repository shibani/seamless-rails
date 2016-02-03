class RestaurantController < ApplicationController

  def index
    @restaurants = Restaurant.all

    if params[:search]

      #use .length with geocoder, not .size or .count
      #@search_location = Geocoder.coordinates(params[:search])
      #Rails.logger.debug "check " + @restaurants.length.to_s.inspect

     @restaurants = Restaurant.near(params[:search], 3)
      
    end

    if params[:latitude] 
      latitude = params[:latitude]
      longitude = params[:longitude]
      #40.7127, 74.0059 
      @restaurants = Restaurant.near([latitude, longitude], 3)
    end

    render :partial => '/restaurant/index.json', :formats => [:json], :locals =>  { restaurants: @restaurants}
  end

  def show
    @restaurant = Restaurant.find_by(name: params[:name])

    render :partial => '/restaurant/show.json', :formats => [:json], :locals =>  { restaurant: @restaurant}
  end

end
