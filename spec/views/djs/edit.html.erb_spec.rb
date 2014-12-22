require 'rails_helper'

RSpec.describe "djs/edit", :type => :view do
  before(:each) do
    @dj = assign(:dj, Dj.create!(
      :maxCapacity => "",
      :userService => "",
      :category => ""
    ))
  end

  it "renders the edit dj form" do
    render

    assert_select "form[action=?][method=?]", dj_path(@dj), "post" do

      assert_select "input#dj_maxCapacity[name=?]", "dj[maxCapacity]"

      assert_select "input#dj_userService[name=?]", "dj[userService]"

      assert_select "input#dj_category[name=?]", "dj[category]"
    end
  end
end
