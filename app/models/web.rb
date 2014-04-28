class Web < ActiveRecord::Base
	has_many :scraping_web
	#paginates_per 50
#scope :name_is, lambda {|name|where("login like ?", "%#{name}%")}
#scope :url_is, lambda {|url|where("name like ?", "%#{url}%")}


end
