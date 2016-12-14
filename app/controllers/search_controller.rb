class SearchController < ApplicationController

  def index
    @stations = Station.create_stations(params[:q], 6)
  end

end
