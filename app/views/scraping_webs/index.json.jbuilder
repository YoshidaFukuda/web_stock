json.array!(@scraping_webs) do |scraping_web|
  json.extract! scraping_web, :id, :name, :url, :html, :facebook, :twitter, :hatena, :deleted_at, :timing
  json.url scraping_web_url(scraping_web, format: :json)
end
