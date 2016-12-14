require 'rails_helper'

describe 'StationsService' do
  context '#find_stations' do
    it "can find stations within a radius" do
      zipcode = 80203
      radius = 6
      results = StationsService.new.find_stations(zipcode, radius)

      # expect(results.count).to eq(10)
      expect(results.class).to eq(StationsService)
    end
  end
end
