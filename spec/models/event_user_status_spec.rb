require 'rails_helper'

RSpec.describe EventUserStatus, :type => :model do
  context 'EventUserStatus' do
    it 'is valid' do
      FactoryGirl.build(:event_user_status).should be_valid
    end
  end
end
