require 'rails_helper'

RSpec.describe EventService, :type => :model do
  context 'EventService' do
    it 'is valid' do
      FactoryGirl.build(:event_service).should be_valid
    end
  end
end
