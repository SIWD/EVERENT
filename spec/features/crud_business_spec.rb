require 'rails_helper'
require 'open-uri'

describe 'Business' do

  context 'CRUD Business' do
    let!(:user1) { FactoryGirl.create(:user) }

    it' sign in user1' do
      sign_in user1
    end

   let!(:profile1) { FactoryGirl.create(:profile, user: user1) }

      it 'creates a business and service' do
        sign_in user1
        visit profile_path(profile1)
        page.should have_content 'Geschäft anlegen'

        click_link_or_button 'Geschäft anlegen'
        fill_in 'business_name', with: 'TestAG'
        fill_in 'address_city', with: 'Meine Stadt 1'
        fill_in 'address_streetName', with: 'Meine Straße'
        fill_in 'address_streetNumber', with: '1'
        click_link_or_button 'Business erstellen'
        page.should have_content 'TestAG'

        click_link_or_button 'Neuen Service anlegen'
        choose('TestAG')
        fill_in 'service_name', with: 'Dienstleistung_XY'
        fill_in 'service_teaser', with: 'Kurzbeschreibung der Dienstleistung'
        fill_in 'service_description', with: 'Längere Beschreibung der Dienstleistung'

        choose("DJ")
        page.should have_content 'Leistungen'
        click_link_or_button 'Service erstellen'
        page.should have_content 'Dienstleistung bearbeiten'
      end
=begin
      it 'creates a new service' do
        visit root_path
        sign_in user1
        visit profile_path(profile1)
        page.should have_content 'TestAG'
        page.should have_content 'Neue Dienstleistung'

        click_link_or_button 'Neue Dienstleistung'
          choose('TestAG')
        fill_in 'service_name', with: 'Dienstleistung_XY'
        fill_in 'teaser', with: 'Kurzbeschreibung der Dienstleistung'
        fill_in 'description', with: 'Längere Beschreibung der Dienstleistung'
          choose('Band')
        click_link_or_button 'Service erstellen'
        page.should have_content 'Dienstleistung bearbeiten'
      end
=begin
      it 'updates the service' do
        visit root_path
        sign_in user1
        visit profile_path(profile1)
        click_link_or_button 'Dienstleistung_XY'
        click_link_or_button 'Dienstleistung bearbeiten'
          expect(page).to have_content 'Service aktualisieren'
          expect(page).to have_content 'Zurück'
        fill_in 'teaser', with: 'Geänderte Kurzbeschreibung'
        click_link_or_button 'Service aktualisieren'
        page.should have_content 'Teaser: Geänderte Kurzbeschreibung'
      end


      it 'visits the business page' do
        click_link 'Zum Unternehmen: My GmbH'
        expect(page).to have_content 'Anzeigen'
        expect(page).to have_content 'Neuen Service anlegen'
        click_link 'Neuen Service anlegen'
      end

      it 'creates a second service' do
        choose('My GmbH')
        fill_in 'name', with: 'Meine zweite Dienstleistung'
        fill_in 'teaser', with: 'Kurzbeschreibung der Dienstleistung 2'
        fill_in 'description', with: 'Längere Beschreibung der Dienstleistung 2'
        choose('Koch')
        click_link_or_button 'Service erstellen'

        expect(page).to have_content 'Dienstleistung bearbeiten'
        expect(page).to have_content 'Zum Unternehmen: My GmbH'
      end

      it 'updates the business' do
        expect(page).to have_content 'Unternehmen Bearbeiten'
        expect(page).to have_content 'Unternehmen löschen'
        click_link 'Unternehmen bearbeiten'
        fill_in 'zipcode', with: '66666'

        expect(page).to have_content 'Show'
        expect(page).to have_content 'Back'
        expect(page).to have_content 'Business aktualisieren'
        click_link 'Business aktualisieren'
      end


      # it 'deletes the service' do
      #
      #
      #
      #
      #
      #

      it 'deletes the business' do
        click_link 'Unternehmen löschen'
        #Pop Up Fenster kommt
        click_link 'OK'
      end
=end
=begin
    let!(:user2) { FactoryGirl.create(:user) }
    it'sign in user2' do
      sign_in user2
    end


    let!(:profile2) { FactoryGirl.create(:profile, user: user2) }

    it 'adds employee' do
      visit root_path
      sign_in user1
      visit profile_path(profile1)
      click_button 'TestGmbH'
      click_link 'Mitarbeiter hinzufügen'
      fill_in 'user_mail', with: user2.mail
      expect(page).to have_content 'Zurück'
      click_button 'Speichern'
      page.should have_content user2.mail
      page.should have_content 'test'
    end

    let!(:user3) { FactoryGirl.create(:user) }
    it'sign in user2' do
      sign_in user3
    end

    let!(:profile3) { FactoryGirl.create(:profile, user: user3) }

      it 'edits employee' do
        visit root_path
        sign_in user1
        visit profiles_path(profile1)
        click_link_or_button 'TestGmbH'
        click_link 'Bearbeiten'
        fill_in 'user_email', with: user3.mail
        click_button 'Speichern'
        page.should have_content user3.mail
      end

      it 'delete employee' do
        click_link 'Aus Unternehmen entfernen'
        click_link_or_button 'OK'
        page.should have_no_content  user3.mail
      end
=end


  end
  end







