require 'rails_helper'

RSpec.describe "djs/index", :type => :view do
  before(:each) do
    assign(:djs, [
      Dj.create!(
        :maxCapacity => "",
        :userService => "",
        :category => ""
      ),
      Dj.create!(
        :maxCapacity => "",
        :userService => "",
        :category => ""
      )
    ])
  end

  it "renders a list of djs" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
