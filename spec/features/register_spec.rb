require 'rails_helper'

describe 'Sign up' do
  before(:each) do
    visit root_path
  end

  it 'allows to sign up' do
    click_link 'Registrieren'
    fill_in 'user_email', with: 'mjohann@rails-experts.com'
    fill_in 'user_password', with: 'Spacken123'
    fill_in 'user_password_confirmation', with: 'Spacken123'

    expect { click_button 'Sign up' }.to change { User.count }.by(1)

    expect(page).to have_content 'mjohann@rails-experts.com'
  end
end