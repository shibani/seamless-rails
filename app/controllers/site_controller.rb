class SiteController < ApplicationController
  
  def home
    #replaces sessions#new
    @bodyclass = "home"
  end
end
