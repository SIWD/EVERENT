require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'allows to sing in' do
      visit root_path
      click_link 'Login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'Helge123'
      click_button 'Sign in'

      expect(page).to have_content "Willkommen, #{user.email}"
    end
  end
end