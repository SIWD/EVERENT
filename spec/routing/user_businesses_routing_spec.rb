require "rails_helper"

RSpec.describe UserBusinessesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_businesses").to route_to("user_businesses#index")
    end

    it "routes to #new" do
      expect(:get => "/user_businesses/new").to route_to("user_businesses#new")
    end

    it "routes to #show" do
      expect(:get => "/user_businesses/1").to route_to("user_businesses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_businesses/1/edit").to route_to("user_businesses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_businesses").to route_to("user_businesses#create")
    end

    it "routes to #update" do
      expect(:put => "/user_businesses/1").to route_to("user_businesses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_businesses/1").to route_to("user_businesses#destroy", :id => "1")
    end

  end
end
