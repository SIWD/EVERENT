require 'rails_helper'

RSpec.describe "Agbs", type: :request do
  describe "GET /agbs" do
    it "works! (now write some real specs)" do
      get agbs_path
      expect(response).to have_http_status(200)
    end
  end
end
