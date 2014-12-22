require 'rails_helper'

RSpec.describe "djs/new", :type => :view do
  before(:each) do
    assign(:dj, Dj.new(
      :maxCapacity => "",
      :userService => "",
      :category => ""
    ))
  end

  it "renders new dj form" do
    render

    assert_select "form[action=?][method=?]", djs_path, "post" do

      assert_select "input#dj_maxCapacity[name=?]", "dj[maxCapacity]"

      assert_select "input#dj_userService[name=?]", "dj[userService]"

      assert_select "input#dj_category[name=?]", "dj[category]"
    end
  end
end
