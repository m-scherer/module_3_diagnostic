class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(name, address, fuel_type, distance, access_times)
    @name = name
    @address = address
    @fuel_type = fuel_type
    @distance = distance
    @access_times = access_times
  end

  def self.create_stations(zipcode, radius)
    stations = StationsService.new.find_stations(zipcode, radius)
    stations.map do |station|
      Station.new(station[:station_name],
                  station[:street_address],
                  station[:fuel_type_code],
                  station[:distance],
                  station[:access_days_time],
                  )
    end[0..9]
  end

end
