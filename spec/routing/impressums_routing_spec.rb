require "rails_helper"

RSpec.describe ImpressumsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/impressums").to route_to("impressums#index")
    end

    it "routes to #new" do
      expect(:get => "/impressums/new").to route_to("impressums#new")
    end

    it "routes to #show" do
      expect(:get => "/impressums/1").to route_to("impressums#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/impressums/1/edit").to route_to("impressums#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/impressums").to route_to("impressums#create")
    end

    it "routes to #update" do
      expect(:put => "/impressums/1").to route_to("impressums#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/impressums/1").to route_to("impressums#destroy", :id => "1")
    end

  end
end
