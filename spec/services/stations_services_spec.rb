require 'rails_helper'

describe 'StationsService' do
  context '#find_stations' do
    it "can find stations within a radius" do
      zipcode = 80203
      radius = 6
      results = StationsService.new.find_stations(zipcode, radius)

      expect(results.class).to eq(StationsService)
      expect(results).to have_key(:station_name)
      expect(results).to have_key(:street_address)
      expect(results).to have_key(:fuel_type_code)
      expect(results).to have_key(:access_days_time)
    end
  end
end
