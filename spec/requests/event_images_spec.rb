require 'rails_helper'

RSpec.describe "EventImages", type: :request do
  describe "GET /event_images" do
    it "works! (now write some real specs)" do
      get event_images_path
      expect(response).to have_http_status(200)
    end
  end
end
