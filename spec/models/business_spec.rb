require 'rails_helper'

RSpec.describe Business, :type => :model do
  context 'Business' do
    it 'is invalid without an address' do
      FactoryGirl.build(:business).should_not be_valid
    end
  end
end
