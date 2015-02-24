require 'rails_helper'
require 'open-uri'

describe 'you cannot register two accounts with one e-mail address' do
  it 'sign up account 1' do
    visit root_path
    click_link 'Registrieren'
    fill_in 'user_email', with: 'user@test.de'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_link 'Registrieren'
    open("http://localhost:3000/users/sign_out")
  end

  it 'sign up account 2' do
    visit root_path
    click_link 'Registrieren'
    fill_in 'user_email', with: 'user@test.de'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_link 'Registrieren'
    page.should_not have_content 'Erfolgreich registriert'
  end
  end
