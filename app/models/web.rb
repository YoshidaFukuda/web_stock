class Web < ActiveRecord::Base

scope :name_is, lambda {|name|where("login like ?", "%#{name}%")}
scope :url_is, lambda {|url|where("name like ?", "%#{url}%")}


end
