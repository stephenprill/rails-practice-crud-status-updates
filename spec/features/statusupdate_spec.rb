require 'rails_helper'
  feature "Createstatus" do

    scenario 'User creates, edits, deletes status' do
      visit statusupdates_path
      click_on "Add a Status"
      fill_in "Status", with: "CRUDn"
      fill_in "User", with: "Chaka"
      fill_in "Likes", with: "20"
      click_on "Submit"
      visit statusupdates_path
      expect(page).to have_content("Chaka")

      click_on "Edit"
      fill_in "Status", with: "CRUDnn"
      fill_in "User", with: "Chakaz"
      fill_in "Likes", with: "21"
      click_on "Submit"

      expect(page).to have_content("Event was successfully updated.")
      click_on "Destroy"
      expect(page).to have_content("Event was successfully deleted")

    end
  end
