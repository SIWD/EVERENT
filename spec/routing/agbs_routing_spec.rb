require "rails_helper"

RSpec.describe AgbsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agbs").to route_to("agbs#index")
    end

    it "routes to #new" do
      expect(:get => "/agbs/new").to route_to("agbs#new")
    end

    it "routes to #show" do
      expect(:get => "/agbs/1").to route_to("agbs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agbs/1/edit").to route_to("agbs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/agbs").to route_to("agbs#create")
    end

    it "routes to #update" do
      expect(:put => "/agbs/1").to route_to("agbs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agbs/1").to route_to("agbs#destroy", :id => "1")
    end

  end
end
