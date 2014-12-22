require "rails_helper"

RSpec.describe DjsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/djs").to route_to("djs#index")
    end

    it "routes to #new" do
      expect(:get => "/djs/new").to route_to("djs#new")
    end

    it "routes to #show" do
      expect(:get => "/djs/1").to route_to("djs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/djs/1/edit").to route_to("djs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/djs").to route_to("djs#create")
    end

    it "routes to #update" do
      expect(:put => "/djs/1").to route_to("djs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/djs/1").to route_to("djs#destroy", :id => "1")
    end

  end
end
