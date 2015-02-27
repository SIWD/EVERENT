require 'rails_helper'

RSpec.describe EventUserJoin, :type => :model do
  context 'EventUserJoin' do
    it 'is valid' do
      FactoryGirl.build(:event_user_join).should be_valid
    end
  end
end
