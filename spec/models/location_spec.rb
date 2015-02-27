require 'rails_helper'

RSpec.describe Location, :type => :model do
  context 'Location' do
    it 'is valid' do
      FactoryGirl.build(:location).should be_valid
    end
  end
end
