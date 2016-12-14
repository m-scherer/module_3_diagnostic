require 'rails_helper'

describe "As a user" do
  context "they can search for a station by zipcode" do
    it "can find stations" do
      visit '/'
      fill_in :q, with: "80203"
      within(".search-field") do
        click_on "Locate"
      end

      expect(current_path).to eq("/search")
      expect(page).to have_content("Stations:")
      expect(page).to have_content("UDR")
    end
  end
end
