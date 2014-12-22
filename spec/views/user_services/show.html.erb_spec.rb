require 'rails_helper'

RSpec.describe "user_services/show", :type => :view do
  before(:each) do
    @user_service = assign(:user_service, UserService.create!(
      :description => "MyText",
      :name => "Name",
      :teaser => "Teaser",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Teaser/)
    expect(rendered).to match(//)
  end
end
