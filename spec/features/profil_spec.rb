require 'rails_helper'

# Wenn ein Profil vorhanden ist,
# darf man kein neues Profil anlegen dürfen,
# sondern nur das vorhandene bearbeiten.

describe 'Profile' do
  context 'an existing Profile' do
    let!(:user){FactoryGirl.create(:user)}

    before(:each) do
      visit new_user_registration_path
    end

    it 'allows not to create a new profile' do
      expect(page).to_not have_content 'New'
    end
  end
end