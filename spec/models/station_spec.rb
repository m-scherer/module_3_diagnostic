require 'rails_helper'

describe 'Stations' do
  context '#create_stations' do
    it "can create stations" do
      zipcode = 80203
      radius = 6
      stations = Station.create_stations(zipcode, radius)
      station = stations.first

      expect(stations.class).to eq(Array)
      expect(station.class).to eq(Station)
      expect(station).to respond_to(:name)
      expect(station).to respond_to(:address)
      expect(station).to respond_to(:fuel_type)
      expect(station).to respond_to(:access_times)
    end
    it "can sort by distance" do
      zipcode = 80203
      radius = 6
      stations = Station.create_stations(zipcode, radius)
      station = stations.first

      expect(station.name).to eq("UDR")
    end
  end
end
