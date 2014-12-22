require 'rails_helper'

RSpec.describe "bands/new", :type => :view do
  before(:each) do
    assign(:band, Band.new(
      :maxCapacity => "",
      :members => "",
      :userService => nil,
      :category => nil
    ))
  end

  it "renders new band form" do
    render

    assert_select "form[action=?][method=?]", bands_path, "post" do

      assert_select "input#band_maxCapacity[name=?]", "band[maxCapacity]"

      assert_select "input#band_members[name=?]", "band[members]"

      assert_select "input#band_userService_id[name=?]", "band[userService_id]"

      assert_select "input#band_category_id[name=?]", "band[category_id]"
    end
  end
end
