class SearchController < ApplicationController

  def index
    @stations = Station.top_ten_stations(params[:q], 6)
  end

end
