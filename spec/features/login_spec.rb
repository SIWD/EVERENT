require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:login_user) { FactoryGirl.create(:user) }

    it 'allows to sing in' do
      visit root_path
      click_link 'Login'
      #let!(:login_user) { FactoryGirl.create(:login_user) }
      fill_in 'user_email', with: login_user.email
      fill_in 'user_password', with: '12341234'
      click_button 'Anmelden'

      #expect(page).to have_content "#{login_user.email}"
      page.should have_content login_user.email
    end
  end
end