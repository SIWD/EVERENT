require 'rails_helper'

RSpec.describe "Profils", :type => :request do
  describe "GET /profils" do
    it "works! (now write some real specs)" do
      get profils_path
      expect(response).to have_http_status(200)
    end
  end
end
