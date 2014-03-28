json.array!(@webs) do |web|
  json.extract! web, :id, :name, :url, :html, :facebook, :twitter, :hatena, :deleted_at
  json.url web_url(web, format: :json)
end
