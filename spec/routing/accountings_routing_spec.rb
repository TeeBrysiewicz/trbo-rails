require "rails_helper"

RSpec.describe AccountingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/accountings").to route_to("accountings#index")
    end

    it "routes to #new" do
      expect(:get => "/accountings/new").to route_to("accountings#new")
    end

    it "routes to #show" do
      expect(:get => "/accountings/1").to route_to("accountings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/accountings/1/edit").to route_to("accountings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/accountings").to route_to("accountings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accountings/1").to route_to("accountings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accountings/1").to route_to("accountings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accountings/1").to route_to("accountings#destroy", :id => "1")
    end

  end
end
