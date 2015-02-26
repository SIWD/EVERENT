require 'rails_helper'

RSpec.describe Business, :type => :model do
  let!(:business1) { FactoryGirl.build(:business, name: nil) }
  let!(:business2) { FactoryGirl.build(:business, name: "Company") }
  let!(:business3) { FactoryGirl.build(:business, name: "Company") }

  context 'valid' do
    it 'is not valid without a name' do
      expect(:business1).to_not be_valid
    end

    it 'is valid with a unique name' do
      expect(:business2).to be_valid
    end

    it 'is not valid with the same name' do
      expect(:business3).to_not be_valid
    end
  end
end
