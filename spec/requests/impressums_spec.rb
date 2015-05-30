require 'rails_helper'

RSpec.describe "Impressums", type: :request do
  describe "GET /impressums" do
    it "works! (now write some real specs)" do
      get impressums_path
      expect(response).to have_http_status(200)
    end
  end
end
