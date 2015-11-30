require "rails_helper"

RSpec.describe LegalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/legals").to route_to("legals#index")
    end

    it "routes to #new" do
      expect(:get => "/legals/new").to route_to("legals#new")
    end

    it "routes to #show" do
      expect(:get => "/legals/1").to route_to("legals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/legals/1/edit").to route_to("legals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/legals").to route_to("legals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/legals/1").to route_to("legals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/legals/1").to route_to("legals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/legals/1").to route_to("legals#destroy", :id => "1")
    end

  end
end
