require 'rails_helper'
require 'open-uri'

describe 'Accountmanagement' do


    let!(:user1) { FactoryGirl.create(:user) }
    let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
    let!(:address1) { FactoryGirl.create(:address) }
    let!(:business1) { FactoryGirl.create(:business, address: address1) }
    let!(:user_business1) { FactoryGirl.create(:user_business, business: business1, user: user1) }

    it 'should not delete profile with business admin' do
      sign_in user1
      visit profile_path(profile1)
      page.should have_content 'Profil und Account löschen'

      click_link_or_button 'Profil und Account löschen'
      page.should have_content 'Bitte verlassen Sie erst alle Unternehmen, in denen Sie ein Administrator sind'

    end

    let!(:user2) { FactoryGirl.create(:user) }
    let!(:profile2) { FactoryGirl.create(:profile, user: user2) }

    it 'should delete profile as user' do
      sign_in user2
      visit profile_path(profile2)
      page.should have_content 'Profil und Account löschen'

      click_link_or_button 'Profil und Account löschen'
      page.should have_content 'Ihr Account wurde erfolgreich gelöscht'
      page.should have_content 'Login'

  end
end



