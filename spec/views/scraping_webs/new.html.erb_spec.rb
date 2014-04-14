require 'spec_helper'

describe "scraping_webs/new" do
  before(:each) do
    assign(:scraping_web, stub_model(ScrapingWeb,
      :name => "MyString",
      :url => "MyString",
      :html => "MyText",
      :facebook => 1,
      :twitter => 1,
      :hatena => 1,
      :timing => 1
    ).as_new_record)
  end

  it "renders new scraping_web form" do
    render

    assert_select "form[action=?][method=?]", scraping_webs_path, "post" do
      assert_select "input#scraping_web_name[name=?]", "scraping_web[name]"
      assert_select "input#scraping_web_url[name=?]", "scraping_web[url]"
      assert_select "textarea#scraping_web_html[name=?]", "scraping_web[html]"
      assert_select "input#scraping_web_facebook[name=?]", "scraping_web[facebook]"
      assert_select "input#scraping_web_twitter[name=?]", "scraping_web[twitter]"
      assert_select "input#scraping_web_hatena[name=?]", "scraping_web[hatena]"
      assert_select "input#scraping_web_timing[name=?]", "scraping_web[timing]"
    end
  end
end
