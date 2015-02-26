require 'rails_helper'
require 'open-uri'

describe 'access of businesses' do

  let!(:address1) { FactoryGirl.create(:address) }
  let!(:business1) { FactoryGirl.create(:business, address: address1) }
  it 'allows not to update businesses' do

    visit businesses_path
    page.should_not have_content 'Löschen'
    page.should_not have_content 'Business-Informationen bearbeiten'
    page.should have_content 'Alle Unternehmen'
  end

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }

  it 'allows to update and delete business' do
    sign_in user1
    visit profile_path(profile1)
    click_link_or_button 'Geschäft anlegen'
    fill_in 'business_name', with: 'TestAG'
    fill_in 'address_city', with: 'Meine Stadt'
    click_link_or_button 'Speichern'
  visit businesses_path
  page.should have_content 'Business-Informationen bearbeiten'
  page.should have_content 'Löschen'
  end


end