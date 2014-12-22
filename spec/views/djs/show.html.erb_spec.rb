require 'rails_helper'

RSpec.describe "djs/show", :type => :view do
  before(:each) do
    @dj = assign(:dj, Dj.create!(
      :maxCapacity => "",
      :userService => "",
      :category => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
