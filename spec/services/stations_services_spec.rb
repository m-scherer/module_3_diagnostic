require 'rails_helper'

describe 'StationsService' do
  context '#find_stations' do
    it "can find stations within a radius" do
      zipcode = 80203
      radius = 6
      stations = StationsService.new.find_stations(zipcode, radius)
      station = stations.first

      expect(stations.class).to eq(Array)
      expect(station).to have_key(:station_name)
      expect(station).to have_key(:street_address)
      expect(station).to have_key(:fuel_type_code)
      expect(station).to have_key(:access_days_time)
    end
  end
end
