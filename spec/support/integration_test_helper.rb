module IntegrationTestHelper
  def sign_in(user)
    visit root_path
    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Helge123'
    click_button 'Anmelden'
  end
end