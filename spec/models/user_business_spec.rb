require 'rails_helper'

RSpec.describe UserBusiness, :type => :model do
  context 'UserBusiness' do
    it 'is invalid without a business and a user' do
      FactoryGirl.build(:user_business).should_not be_valid
    end
  end
end
