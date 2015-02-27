require 'rails_helper'

RSpec.describe Profile, :type => :model do
  context 'Profile' do
    it 'is invalid without a user' do
      FactoryGirl.build(:profile).should_not be_valid
    end
  end
end
