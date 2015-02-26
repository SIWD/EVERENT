require 'rails_helper'

RSpec.describe BranchCategory, :type => :model do
  context 'BranchCategory' do
    it 'is valid' do
      FactoryGirl.build(:branch_category).should be_valid
    end
  end
end
