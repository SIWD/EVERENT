require 'rails_helper'

RSpec.describe WhoHasAccessToEvent, :type => :model do
  context 'WhoHasAccessToEvent' do
    it 'is valid' do
      FactoryGirl.build(:who_has_access_to_event).should be_valid
    end
  end
end
