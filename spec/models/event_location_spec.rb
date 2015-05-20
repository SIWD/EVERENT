require 'rails_helper'

RSpec.describe EventLocation, :type => :model do
  context 'EventLocation' do
    it 'is invalid without a host' do
      FactoryGirl.build(:event_location).should_not be_valid
    end
  end
end
