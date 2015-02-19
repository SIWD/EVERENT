require 'rails_helper'

RSpec.describe "UserBusinesses", :type => :request do
  describe "GET /user_businesses" do
    it "works! (now write some real specs)" do
      get user_businesses_path
      expect(response).to have_http_status(200)
    end
  end
end
