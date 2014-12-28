require 'rails_helper'

RSpec.describe "MusicTypes", :type => :request do
  describe "GET /music_types" do
    it "works! (now write some real specs)" do
      get music_types_path
      expect(response).to have_http_status(200)
    end
  end
end
