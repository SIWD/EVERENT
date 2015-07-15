require 'rails_helper'

RSpec.describe "Guestlists", type: :request do
  describe "GET /guestlists" do
    it "works! (now write some real specs)" do
      get guestlists_path
      expect(response).to have_http_status(200)
    end
  end
end
