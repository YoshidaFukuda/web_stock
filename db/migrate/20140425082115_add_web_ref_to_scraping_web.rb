class AddWebRefToScrapingWeb < ActiveRecord::Migration
  def change
    add_reference :scraping_webs, :web, index: true
  end
end
