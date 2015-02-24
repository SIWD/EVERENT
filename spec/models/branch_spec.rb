require 'rails_helper'

RSpec.describe Branch, :type => :model do
  let!(:branch1) { FactoryGirl.build(:branch) }
  let!(:branch_category) { FactoryGirl.build(:branch_category) }
  let!(:branch2) { FactoryGirl.build(:branch, branchCategory: branch_category) }

  context 'valid' do
    it 'is not valid with the same name' do
      expect(:branch2).to_not be_valid
    end

    it 'is not valid without a branch_category' do
      expect(:branch1).to_not be_valid
    end
  end
end