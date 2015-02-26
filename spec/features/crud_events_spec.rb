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

  it 'not allows empty fields' do
    sign_in user1
    click_link_or_button 'Events'
    click_link 'Event anlegen'
    click_link_or_button 'Event erstellen'

    page.should have_content '4 errors prohibited this event from being saved:'
  end

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }

  it 'creates event' do
    sign_in user1
    visit root_path
    click_link_or_button 'Events'
    click_link 'Event anlegen'

    fill_in 'event_name', with: 'Eventname'
    check 'host_profile_ids_1'
    fill_in 'eventLocation_name', with: 'Standort des Event'


  end

end