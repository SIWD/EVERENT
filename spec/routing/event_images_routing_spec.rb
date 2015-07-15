require "rails_helper"

RSpec.describe EventImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_images").to route_to("event_images#index")
    end

    it "routes to #new" do
      expect(:get => "/event_images/new").to route_to("event_images#new")
    end

    it "routes to #show" do
      expect(:get => "/event_images/1").to route_to("event_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_images/1/edit").to route_to("event_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_images").to route_to("event_images#create")
    end

    it "routes to #update" do
      expect(:put => "/event_images/1").to route_to("event_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_images/1").to route_to("event_images#destroy", :id => "1")
    end

  end
end
