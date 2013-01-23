require "spec_helper"

describe InterpretersController do
  describe "routing" do

    it "routes to #index" do
      get("/interpreters").should route_to("interpreters#index")
    end

    it "routes to #new" do
      get("/interpreters/new").should route_to("interpreters#new")
    end

    it "routes to #show" do
      get("/interpreters/1").should route_to("interpreters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/interpreters/1/edit").should route_to("interpreters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/interpreters").should route_to("interpreters#create")
    end

    it "routes to #update" do
      put("/interpreters/1").should route_to("interpreters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/interpreters/1").should route_to("interpreters#destroy", :id => "1")
    end

  end
end
