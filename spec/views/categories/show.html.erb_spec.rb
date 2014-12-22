require 'rails_helper'

RSpec.describe "categories/show", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :teaser => "Teaser",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Teaser/)
    expect(rendered).to match(/Name/)
  end
end
