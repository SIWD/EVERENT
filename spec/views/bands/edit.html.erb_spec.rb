require 'rails_helper'

RSpec.describe "bands/edit", :type => :view do
  before(:each) do
    @band = assign(:band, Band.create!(
      :maxCapacity => "",
      :members => "",
      :userService => nil,
      :category => nil
    ))
  end

  it "renders the edit band form" do
    render

    assert_select "form[action=?][method=?]", band_path(@band), "post" do

      assert_select "input#band_maxCapacity[name=?]", "band[maxCapacity]"

      assert_select "input#band_members[name=?]", "band[members]"

      assert_select "input#band_userService_id[name=?]", "band[userService_id]"

      assert_select "input#band_category_id[name=?]", "band[category_id]"
    end
  end
end
