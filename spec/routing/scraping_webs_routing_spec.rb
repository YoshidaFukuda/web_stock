require "spec_helper"

describe ScrapingWebsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scraping_webs").to route_to("scraping_webs#index")
    end

    it "routes to #new" do
      expect(:get => "/scraping_webs/new").to route_to("scraping_webs#new")
    end

    it "routes to #show" do
      expect(:get => "/scraping_webs/1").to route_to("scraping_webs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scraping_webs/1/edit").to route_to("scraping_webs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scraping_webs").to route_to("scraping_webs#create")
    end

    it "routes to #update" do
      expect(:put => "/scraping_webs/1").to route_to("scraping_webs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scraping_webs/1").to route_to("scraping_webs#destroy", :id => "1")
    end

  end
end
