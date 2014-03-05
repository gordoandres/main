require "spec_helper"

describe ProblemasController do
  describe "routing" do

    it "routes to #index" do
      get("/problemas").should route_to("problemas#index")
    end

    it "routes to #new" do
      get("/problemas/new").should route_to("problemas#new")
    end

    it "routes to #show" do
      get("/problemas/1").should route_to("problemas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/problemas/1/edit").should route_to("problemas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/problemas").should route_to("problemas#create")
    end

    it "routes to #update" do
      put("/problemas/1").should route_to("problemas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/problemas/1").should route_to("problemas#destroy", :id => "1")
    end

  end
end
