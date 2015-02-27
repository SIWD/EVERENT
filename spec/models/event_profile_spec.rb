require 'rails_helper'

RSpec.describe EventProfile, :type => :model do
  context 'EventProfile' do
    it 'is valid' do
      FactoryGirl.build(:event_profile).should be_valid
    end
  end
end
