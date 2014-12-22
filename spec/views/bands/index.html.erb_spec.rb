require 'rails_helper'

RSpec.describe "bands/index", :type => :view do
  before(:each) do
    assign(:bands, [
      Band.create!(
        :maxCapacity => "",
        :members => "",
        :userService => nil,
        :category => nil
      ),
      Band.create!(
        :maxCapacity => "",
        :members => "",
        :userService => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of bands" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
