require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:login_user) { FactoryGirl.create(:user) }

    it 'allows to sing in' do
      visit root_path
      sign_in login_user
      page.should have_content login_user.email
    end
  end
end



