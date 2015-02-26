=begin

require 'rails_helper'
require 'open-uri'

describe 'events' do
# page.should have_content ''
  it 'should not create without being user' do
    visit root_path
    click_link_or_button 'Events'
    page.should have_content 'Event anlegen'

    click_link 'Event anlegen'
    page.should have_content 'Bitte loggen Sie sich zuerst ein, um ein Event zu erstellen!'
    page.should have_content 'Anmelden'
  end

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
  let!(:access) { FactoryGirl.create(:who_has_access_to_event) }

  it 'not allows empty fields' do
    visit root_path
    sign_in user1
    click_link_or_button 'Events'

    click_link 'Event anlegen'
    page.should have_content 'Speichern'
    click_link_or_button 'Speichern'

    #page.execute_script("$('form#new_event').submit()")
    page.should have_content '4 errors prohibited this event from being saved:'

  end

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
  let!(:access) { FactoryGirl.create(:who_has_access_to_event) }

  it 'creates, updates and deletes event' do

    #create event
    sign_in user1
    visit root_path
    click_link_or_button 'Events'
    click_link 'Event anlegen'

    fill_in 'event_name', with: 'Eventname'
    check 'host_profile_ids_1'
    fill_in 'eventLocation_name', with: 'Standort des Event'
    fill_in 'address_city', with: 'Stadt des Event'

    choose 'Jeder'
    page.should have_content 'xxx'
    click_link_or_button 'Speichern'
    page.should have_content 'Bearbeiten'
    page.should have_content 'Zurück'

    #update event
    visit event_path
    page.should have_content 'Bearbeiten'
    click_link_or_button 'Bearbeiten'
    fill_in fill_in 'event_name', with: 'Geänderter Eventname'
    click_link_or_button 'Speichern'
    page.should have_content 'Event-neu'

    #detele event
    visit event_path
    page.should have_content 'Löschen'
    click_link_or_button 'Löschen'
    page.should have_content "'Event-neu' wurde gelöscht"
    page.should_not have_content 'Anzeigen'

  end

end
=end