require "rails_helper"

RSpec.describe GuestlistDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guestlist_details").to route_to("guestlist_details#index")
    end

    it "routes to #new" do
      expect(:get => "/guestlist_details/new").to route_to("guestlist_details#new")
    end

    it "routes to #show" do
      expect(:get => "/guestlist_details/1").to route_to("guestlist_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/guestlist_details/1/edit").to route_to("guestlist_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/guestlist_details").to route_to("guestlist_details#create")
    end

    it "routes to #update" do
      expect(:put => "/guestlist_details/1").to route_to("guestlist_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guestlist_details/1").to route_to("guestlist_details#destroy", :id => "1")
    end

  end
end
