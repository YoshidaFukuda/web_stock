class AddScrapingWebIdToWeb < ActiveRecord::Migration
  def change
    add_column :webs, :scraping_web_id, :integer
  end
end
