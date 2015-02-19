module IntegrationTestHelper
  def sign_in(user)
    visit root_path
    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '12341234'
    click_button 'Anmelden'


  end

  def create_profile(user)
    let!(:profile) { FactoryGirl.create(:profile, user: user) }
  end
end