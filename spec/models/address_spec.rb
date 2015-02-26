require 'rails_helper'

RSpec.describe Address, :type => :model do
  context 'Address' do
    it 'is valid' do
      FactoryGirl.build(:address).should be_valid
    end
  end
end
