require 'rails_helper'

RSpec.describe "UserBusinesses", :type => :request do
  describe "GET /user_businesses" do
    it "works! (now write some real specs)" do
      get user_businesses_path
      #Expect to have Status 302, because the method redirects in the controller (the show-method is not used)
      expect(response).to have_http_status(302)
    end
  end
end
