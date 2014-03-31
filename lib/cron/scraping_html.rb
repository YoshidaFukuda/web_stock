

require './app/models/web'

class Cron::ScrapingHtml

  def self.scraping_html

  	p 'test'

  	web = Web.find(:all)


  	p web.map { |e| e.url }

  	

    


  end

end