require 'rails_helper'

RSpec.describe "user_services/new", :type => :view do
  before(:each) do
    assign(:user_service, UserService.new(
      :description => "MyText",
      :name => "MyString",
      :teaser => "MyString",
      :user => nil
    ))
  end

  it "renders new user_service form" do
    render

    assert_select "form[action=?][method=?]", user_services_path, "post" do

      assert_select "textarea#user_service_description[name=?]", "user_service[description]"

      assert_select "input#user_service_name[name=?]", "user_service[name]"

      assert_select "input#user_service_teaser[name=?]", "user_service[teaser]"

      assert_select "input#user_service_user_id[name=?]", "user_service[user_id]"
    end
  end
end
