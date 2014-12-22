require 'rails_helper'

RSpec.describe "bands/show", :type => :view do
  before(:each) do
    @band = assign(:band, Band.create!(
      :maxCapacity => "",
      :members => "",
      :userService => nil,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
