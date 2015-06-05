require 'rails_helper'

RSpec.describe "SimpleSites", type: :request do
  describe "GET /simple_sites" do
    it "works! (now write some real specs)" do
      get simple_sites_path
      expect(response).to have_http_status(200)
    end
  end
end
