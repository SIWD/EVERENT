require "rails_helper"

RSpec.describe GuestlistsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guestlists").to route_to("guestlists#index")
    end

    it "routes to #new" do
      expect(:get => "/guestlists/new").to route_to("guestlists#new")
    end

    it "routes to #show" do
      expect(:get => "/guestlists/1").to route_to("guestlists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guestlists/1/edit").to route_to("guestlists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/guestlists").to route_to("guestlists#create")
    end

    it "routes to #update" do
      expect(:put => "/guestlists/1").to route_to("guestlists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guestlists/1").to route_to("guestlists#destroy", :id => "1")
    end

  end
end
