require 'rails_helper'

RSpec.describe EventImage, :type => :model do
  context 'EventImage' do
    it 'is valid' do
      FactoryGirl.build(:event_image).should be_valid
    end
  end
end
