require 'rails_helper'

RSpec.describe "Djs", :type => :request do
  describe "GET /djs" do
    it "works! (now write some real specs)" do
      get djs_path
      expect(response).to have_http_status(200)
    end
  end
end
