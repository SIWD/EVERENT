require 'rails_helper'

RSpec.describe Branch, :type => :model do



  context 'Branch' do
=begin
    it 'is not valid with the same name' do
      branch_category = FactoryGirl.build(:branch_category)

      FactoryGirl.build(:branch, name: 'Taxi', branchCategory: branch_category)
      FactoryGirl.build(:branch, name: 'Taxi', branchCategory: branch_category).should_not be_valid


    end
=end

    it 'is not valid without a branch_category' do
      FactoryGirl.build(:branch).should_not be_valid

      branch_category = FactoryGirl.build(:branch_category)
      FactoryGirl.build(:branch, branchCategory: branch_category).should be_valid
    end
  end
end