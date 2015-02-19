require 'rails_helper'
require 'open-uri'

describe 'delete business of my profile' do
  it 'allows to sign up' do
    visit root_path
    click_link 'Registrieren'
    fill_in 'user_email', with: 'user@test.de'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_link_or_button 'Registrieren'
  end

  it 'allows to create profile' do
    fill_in 'gender', with: 'male'
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

  it 'delete employee' do
    click_link 'Aus Unternehmen entfernen'
    click_link_or_button 'OK'
    open("http://localhost:3000/profiles/1")
    page.should have_no_content 'My GmbH'
  end

  it 'try edit other business' do
  open("http://localhost:3000/businesses/1")
  page.should have_no_content  'Neue Dienstleistungen anlegen'
  page.should have_no_content  'Mitarbeiter hinzufügen'
  end

  it 'try edit other businesses service' do
    click_link 'Anzeigen'
    page.should have_no_content  'Dienstleistung bearbeiten'
  end

  it 'adds employee to other business' do
    open("http://localhost:3000/profiles/1")
    click_link 'Mitarbeiter hinzufügen'
    fill_in 'user_email', with: 'test@test.de'
    click_button 'Speichern'
    page.should have_no_content  'test@test.de'
  end

end
