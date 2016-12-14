require 'rails_helper'

describe "As a user" do
  context "they can search for a station by zipcode" do
    it "can find stations" do
      visit '/'
      fill_in :zipcode, with: "80203"
      click_on "Locate"

      expect(current_path).to eq("/search")
      expect(page).to have_content(6)
    end
  end
end
