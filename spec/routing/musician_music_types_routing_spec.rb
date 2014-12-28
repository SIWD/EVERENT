require "rails_helper"

RSpec.describe MusicianMusicTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/musician_music_types").to route_to("musician_music_types#index")
    end

    it "routes to #new" do
      expect(:get => "/musician_music_types/new").to route_to("musician_music_types#new")
    end

    it "routes to #show" do
      expect(:get => "/musician_music_types/1").to route_to("musician_music_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/musician_music_types/1/edit").to route_to("musician_music_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/musician_music_types").to route_to("musician_music_types#create")
    end

    it "routes to #update" do
      expect(:put => "/musician_music_types/1").to route_to("musician_music_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/musician_music_types/1").to route_to("musician_music_types#destroy", :id => "1")
    end

  end
end
