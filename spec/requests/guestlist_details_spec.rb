require 'rails_helper'

RSpec.describe "GuestlistDetails", type: :request do
  describe "GET /guestlist_details" do
    it "works! (now write some real specs)" do
      get guestlist_details_path
      expect(response).to have_http_status(200)
    end
  end
end
