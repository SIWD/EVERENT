require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'allows to sing in' do
      visit root_path
      click_link 'Login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'Helge123'
      click_button 'Anmelden'

      expect(page).to have_content "#{user.email}"
    end
  end
end