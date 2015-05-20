require 'rails_helper'

RSpec.describe EventBusiness, :type => :model do
  context 'EventBusiness' do
    it 'is valid' do
      FactoryGirl.build(:event_business).should be_valid
    end
  end
end
