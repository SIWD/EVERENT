require 'rails_helper'
require 'open-uri'
#OPEN URI ist zum öffnen von Links notwendig

describe 'it tests the business function' do
  it 'allows to sign up' do
    visit root_path
    click_link 'Registrieren'
    fill_in 'user_email', with: 'user@test.de'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_link 'Registrieren'
  end

  it 'allows to create profile' do
    fill_in 'profile_gender', with: 'male'
    fill_in 'firstname', with: 'nils'
    fill_in 'lastname', with: 'test'
    fill_in 'phone', with: '1234'
    fill_in 'city', with: 'Stadt'
    fill_in 'postcode', with: '12345'
    fill_in 'streetname', with: 'Straße'
    fill_in 'housenumber', with: '2'
    fill_in 'user_password', with: '12345678'
    click_button 'Profil erstellen'
    expect(page).to have_content 'Geschäft anlegen'
  end

  it 'creates a business' do
    click_link 'Geschäft anlegen'
  fill_in 'name', with: "My GmbH"
  fill_in 'city', with: "Hamburg"
  fill_in 'zipcode', with: "12345"
  fill_in 'streetname', with: "Hauptstr"
  fill_in 'streetnumber', with: "1"
    expect(page).to have_content 'Neue Dienstleistung anlegen'
  end


  it 'creates a new service' do

    click_link 'Neue Dienstleistung anlegen'
      expect(page).to have_content 'Service erstellen'
      expect(page).to have_content 'Back'

      choose('My GmbH')
    fill_in 'name', with: 'Meine Dienstleistung'
    fill_in 'teaser', with: 'Kurzbeschreibung der Dienstleistung'
    fill_in 'description', with: 'Längere Beschreibung der Dienstleistung'
      choose('Band')
    click_link_or_button 'Service erstellen'

    expect(page).to have_content 'Dienstleistung bearbeiten'
    expect(page).to have_content 'Zum Unternehmen: My GmbH'
  end

  it 'updates the service' do
    click_link 'Dienstleistung bearbeiten '
      expect(page).to have_content 'Show'
      expect(page).to have_content 'Back'
    fill_in 'teaser', with: 'Geänderte Kurzbeschreibung'
    click_link_or_button 'Service aktualisieren'
    expect(page).to have_content 'Teaser: Geänderte Kurzbeschreibung'
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
    fill_in 'zipcode', with '66666'

    expect(page).to have_content 'Show'
    expect(page).to have_content 'Back'
    expect(page).to have_content 'Business aktualisieren'
    click_link 'Business aktualisieren'
  end

  it 'deletes the business' do
    click_link 'Unternehmen löschen'
    #Pop Up Fenster kommt
    # click_link 'Ok'
  end
end




