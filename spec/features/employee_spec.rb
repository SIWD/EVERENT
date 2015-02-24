require 'rails_helper'
require 'open-uri'

describe 'actions employee' do

  context 'describe employee' do

    let!(:user1) { FactoryGirl.create(:user) }
    let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:profile2) { FactoryGirl.create(:profile, user: user2) }
    let!(:user3) { FactoryGirl.create(:user) }
    let!(:profile3) { FactoryGirl.create(:profile, user: user3) }

    it 'add, update, delete employee' do
      # add employee
      sign_in user1
      visit profile_path(profile1)
      page.should have_content 'Geschäft anlegen'

      click_link_or_button 'Geschäft anlegen'
      fill_in 'business_name', with: 'TestAG'
      click_link_or_button 'Speichern'
      page.should have_content 'TestAG'

      click_link 'Mitarbeiter hinzufügen'
      fill_in 'user_email', with: user2.email
      select 'Mitarbeiter', from: 'user_business_position'
      expect(page).to have_content 'Zurück'
      click_button 'Speichern'
      page.should have_content user2.email

      click_link 'Mitarbeiter hinzufügen'
      fill_in 'user_email', with: user3.email
      select 'Administrator', from: 'user_business_position'
      expect(page).to have_content 'Zurück'
      click_button 'Speichern'
      page.should have_content user3.email
      click_link_or_button 'Logout'

      #delete employee
      sign_in user3
      visit profile_path(profile3)
      click_link 'TestAG'

      first(:link, 'Aus Unternehmen entfernen').click
      first(:link, 'Aus Unternehmen entfernen').click
      visit current_path
      page.should_not have_content user1.email
      page.should_not have_content user2.email

    end
  end
end