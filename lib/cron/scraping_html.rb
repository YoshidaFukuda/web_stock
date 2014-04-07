

#coding:utf-8
require './app/models/web'
require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'net/http'
require 'json'


class Cron::ScrapingHtml

  def self.scraping_html

  	
  	web = Web.find(:all)#,:conditions => ["timing = ?", 1])
  	p web
  	url = []

  	

  	web.map { |e| url << e.url}

  	
  	url.map { |e|  
  		web_stock = Web.new

  		
  		#html解析	
  		charset = nil
		html = open(e) do |f|
  			charset = f.charset # 文字種別を取得
  			f.read # htmlを読み込んで変数htmlに渡す
		end

		doc = Nokogiri::HTML.parse(html, nil, charset)
		p web_stock.name = doc.title
		web_stock.html = html
		web_stock.url = e
		
		
		
		
		fb_uri="http://graph.facebook.com/"+e
		p web_stock.facebook =  JSON.parse(open(fb_uri).read)['shares'].to_i
		
		
		hatena_uri="http://b.hatena.ne.jp/entry/jsonlite/?url="+CGI.escape(e)
		web_stock.hatena = JSON.parse(open(hatena_uri).read)['count'].to_i
		
		tweet_uri = "http://urls.api.twitter.com/1/urls/count.json?url="+CGI.escape(e)
		web_stock.twitter = JSON.parse(open(tweet_uri).read)['count'].to_i


		p web_stock.save


	}



  	

    


  end

end