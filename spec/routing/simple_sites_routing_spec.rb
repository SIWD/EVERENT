require "rails_helper"

RSpec.describe SimpleSitesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/simple_sites").to route_to("simple_sites#index")
    end

    it "routes to #new" do
      expect(:get => "/simple_sites/new").to route_to("simple_sites#new")
    end

    it "routes to #show" do
      expect(:get => "/simple_sites/1").to route_to("simple_sites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/simple_sites/1/edit").to route_to("simple_sites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/simple_sites").to route_to("simple_sites#create")
    end

    it "routes to #update" do
      expect(:put => "/simple_sites/1").to route_to("simple_sites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/simple_sites/1").to route_to("simple_sites#destroy", :id => "1")
    end

  end
end
