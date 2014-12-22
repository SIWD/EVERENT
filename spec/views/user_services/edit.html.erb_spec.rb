require 'rails_helper'

RSpec.describe "user_services/edit", :type => :view do
  before(:each) do
    @user_service = assign(:user_service, UserService.create!(
      :description => "MyText",
      :name => "MyString",
      :teaser => "MyString",
      :user => nil
    ))
  end

  it "renders the edit user_service form" do
    render

    assert_select "form[action=?][method=?]", user_service_path(@user_service), "post" do

      assert_select "textarea#user_service_description[name=?]", "user_service[description]"

      assert_select "input#user_service_name[name=?]", "user_service[name]"

      assert_select "input#user_service_teaser[name=?]", "user_service[teaser]"

      assert_select "input#user_service_user_id[name=?]", "user_service[user_id]"
    end
  end
end
