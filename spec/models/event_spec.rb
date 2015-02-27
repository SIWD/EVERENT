require 'rails_helper'

RSpec.describe Event, :type => :model do
  context 'Event' do
    it 'is invalid without location and privacy setting' do
      FactoryGirl.build(:event).should_not be_valid
    end
  end
end
