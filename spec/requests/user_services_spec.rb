require 'rails_helper'

RSpec.describe "UserServices", :type => :request do
  describe "GET /user_services" do
    it "works! (now write some real specs)" do
      get user_services_path
      expect(response).to have_http_status(200)
    end
  end
end
