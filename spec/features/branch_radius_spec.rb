require 'rails_helper'
require 'open-uri'

describe 'test filter' do
  context 'branch' do

    let!(:address1) { FactoryGirl.create(:address,streetName: 'Viktualienmarkt', streetNumber: 1, zipcode: 80995, city: "München") }
    let!(:business1) { FactoryGirl.create(:business,address: address1) }
    let!(:branch_category1) { FactoryGirl.create(:branch_category) }
    let!(:branch1) { FactoryGirl.create(:branch, branchCategory: branch_category1) }
    let!(:service1) { FactoryGirl.create(:service, business: business1, branch: branch1) }

    let!(:address2) { FactoryGirl.create(:address,streetName: 'Heekweg', streetNumber: 7, zipcode: 48161, city: "Münster") }
    let!(:business2) { FactoryGirl.create(:business,name: 'TestAG',address: address2) }
    let!(:service2) { FactoryGirl.create(:service, business: business2, branch: branch1) }

    it 'browse to services > Taxi' do
      visit ('http://localhost:3000/Branche/Taxi')
      fill_in 'location', with: 'Münster'
      click_link_or_button 'Filtern'

      page.should have_content 'TestAG'
      page.should_not have_content 'Testfirma'
        end
    end
  end