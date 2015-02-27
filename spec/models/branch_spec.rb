require 'rails_helper'

RSpec.describe Branch, :type => :model do

  context 'Branch' do
    it 'is not valid without a branch_category' do
      FactoryGirl.build(:branch).should_not be_valid
    end

    it 'is valid with a branch_category' do
      branch_category = FactoryGirl.build(:branch_category)
      FactoryGirl.build(:branch, branchCategory: branch_category).should be_valid
    end
  end
end