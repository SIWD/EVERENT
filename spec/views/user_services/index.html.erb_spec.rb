require 'rails_helper'

RSpec.describe "user_services/index", :type => :view do
  before(:each) do
    assign(:user_services, [
      UserService.create!(
        :description => "MyText",
        :name => "Name",
        :teaser => "Teaser",
        :user => nil
      ),
      UserService.create!(
        :description => "MyText",
        :name => "Name",
        :teaser => "Teaser",
        :user => nil
      )
    ])
  end

  it "renders a list of user_services" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Teaser".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
