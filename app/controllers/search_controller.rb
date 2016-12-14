class SearchController < ApplicationController

  def index
    require "pry"; binding.pry
    @stations = Station.create_stations(params[:q], 6)
  end

end
