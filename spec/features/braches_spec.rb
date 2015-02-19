require 'rails_helper'
require 'open-uri'

describe 'it tests the branches ' do
  it 'browse to branches' do
    visit root_path
    open('http://localhost:3000/Branchen')
    page.should have_content 'All'
  end

  it 'choose branch' do
    click_link 'Florist'
    page.should have_content 'Zurück zu "Alle Branchen"'
  end

  it 'switch back to branches' do
    click_link 'Zurück zu "Alle Branchen'
    page.should have_content 'All'
  end


  end