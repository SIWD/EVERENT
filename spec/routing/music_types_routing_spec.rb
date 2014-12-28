require "rails_helper"

RSpec.describe MusicTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/music_types").to route_to("music_types#index")
    end

    it "routes to #new" do
      expect(:get => "/music_types/new").to route_to("music_types#new")
    end

    it "routes to #show" do
      expect(:get => "/music_types/1").to route_to("music_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/music_types/1/edit").to route_to("music_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/music_types").to route_to("music_types#create")
    end

    it "routes to #update" do
      expect(:put => "/music_types/1").to route_to("music_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/music_types/1").to route_to("music_types#destroy", :id => "1")
    end

  end
end
