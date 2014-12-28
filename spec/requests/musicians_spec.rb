require 'rails_helper'

RSpec.describe "Musicians", :type => :request do
  describe "GET /musicians" do
    it "works! (now write some real specs)" do
      get musicians_path
      expect(response).to have_http_status(200)
    end
  end
end
