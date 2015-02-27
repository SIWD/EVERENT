require 'rails_helper'
require 'open-uri'

describe 'Business' do

  context 'CRUD Business' do

    let!(:user1) { FactoryGirl.create(:user) }
    let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
    let!(:branch_category1) { FactoryGirl.create(:branch_category) }
    let!(:branch1) { FactoryGirl.create(:branch, branchCategory: branch_category1) }
      it 'creates a business and service' do
        sign_in user1
        visit profile_path(profile1)
        page.should have_content 'Geschäft anlegen'

        click_link_or_button 'Geschäft anlegen'
        fill_in 'business_name', with: 'TestAG'
        fill_in 'address_city', with: 'Meine Stadt 1'
        fill_in 'address_streetName', with: 'Meine Straße'
        fill_in 'address_streetNumber', with: '1'
        click_link_or_button 'Speichern'
        page.should have_content 'TestAG'

        click_link_or_button 'Neue Dienstleistung anlegen'
        choose('TestAG')
        fill_in 'service_name', with: 'Dienstleistung_XY'
        fill_in 'service_teaser', with: 'Kurzbeschreibung der Dienstleistung'
        fill_in 'service_description', with: 'Längere Beschreibung der Dienstleistung'
        page.choose('Taxi')
        click_link_or_button 'Speichern'
        page.should have_content 'Dienstleistung bearbeiten'
      end

    #-----------------------------------------------------------------------------

    let!(:address1) { FactoryGirl.create(:address) }
    let!(:business1) { FactoryGirl.create(:business,address: address1) }
    let!(:user_business1) { FactoryGirl.create(:user_business, business: business1, user: user1) }
    let!(:service1) { FactoryGirl.create(:service, business: business1, branch: branch1) }

      it 'updates the service' do
        visit root_path
        sign_in user1
        visit profile_path(profile1)
        click_link_or_button 'Testservice'
        click_link_or_button 'Dienstleistung bearbeiten'

        fill_in 'service_teaser', with: 'Geänderte Kurzbeschreibung'
        click_link_or_button 'Speichern'
        page.should have_content 'Teaser: Geänderte Kurzbeschreibung'
      end

    #-----------------------------------------------------------------------------
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:profile2) { FactoryGirl.create(:profile, user: user2) }

    it 'updates the business' do

      sign_in user2
      visit profile_path(profile2)
      click_link_or_button 'Geschäft anlegen'
      fill_in 'business_name', with: '-TestAG-'
      fill_in 'address_city', with: 'Stadt'
      click_link_or_button 'Speichern'

      expect(page).to have_content 'Unternehmen Bearbeiten'
      expect(page).to have_content 'Unternehmen löschen'
      click_link 'Unternehmen Bearbeiten'
      fill_in 'address_zipcode', with: '66666'
      expect(page).to have_content 'Zurück'
      click_link_or_button 'Speichern'
      page.should have_content 'PLZ: 66666'

    end

    let!(:user3) { FactoryGirl.create(:user) }
    let!(:profile3) { FactoryGirl.create(:profile, user: user3) }

    it 'deletes the business' do

      sign_in user3
      visit profile_path(profile3)
      click_link_or_button 'Geschäft anlegen'
      fill_in 'business_name', with: 'DeleteAG'
      fill_in 'address_city', with: 'Stadt'
      click_link_or_button 'Speichern'

      page.should have_content 'Unternehmen löschen'
      click_link 'Unternehmen löschen'

      page.should have_content 'Alle Unternehmen'
      page.should have_content "'DeleteAG' wurde entfernt"
    end

  end
end





