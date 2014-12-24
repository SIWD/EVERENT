require "rails_helper"

RSpec.describe ProfilsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/profils").to route_to("profils#index")
    end

    it "routes to #new" do
      expect(:get => "/profils/new").to route_to("profils#new")
    end

    it "routes to #show" do
      expect(:get => "/profils/1").to route_to("profils#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profils/1/edit").to route_to("profils#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/profils").to route_to("profils#create")
    end

    it "routes to #update" do
      expect(:put => "/profils/1").to route_to("profils#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profils/1").to route_to("profils#destroy", :id => "1")
    end

  end
end
