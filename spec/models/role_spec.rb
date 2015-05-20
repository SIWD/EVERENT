require 'rails_helper'

RSpec.describe Role, :type => :model do
  context 'Role' do
    it 'is valid' do
      FactoryGirl.build(:role).should be_valid
    end
  end
end
