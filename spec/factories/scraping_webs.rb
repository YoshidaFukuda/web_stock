# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scraping_web do
    name "MyString"
    url "MyString"
    html "MyText"
    facebook 1
    twitter 1
    hatena 1
    deleted_at "2014-04-14 18:46:15"
    timing 1
  end
end
