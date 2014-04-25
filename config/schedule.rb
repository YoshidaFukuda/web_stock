# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# 
# 
# log_path = Whenever.path + '/log/cron.log'
# error_log_path = Whenever.path + '/log/cron_error.log'
# set :output, { :standard => log_path, :error => error_log_path}
# set :environment, :production
 

log_path = Whenever.path + '/log/cron.log'
error_log_path = Whenever.path + '/log/cron_error.log'
set :output, { :standard => log_path, :error => error_log_path}
set :environment, :development

# every 1.minutes do
#   runner "Cron::ScrapingHtml.scraping_html"
# end

every 10.minutes do
  runner "Cron::ScrapingHtml.scraping_html"
end

every 30.minutes do
  runner "Cron::ScrapingHtml.scraping_html"
end

every 1.hours do
  runner "Cron::ScrapingHtml.scraping_html"
end

every 1.days do
  runner "Cron::ScrapingHtml.scraping_html"
end










