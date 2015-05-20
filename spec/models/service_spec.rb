require 'rails_helper'

RSpec.describe Service, :type => :model do
  context 'Service' do
    it 'is invalid without a business and without a branch' do
      FactoryGirl.build(:service).should_not be_valid
    end
  end
end
