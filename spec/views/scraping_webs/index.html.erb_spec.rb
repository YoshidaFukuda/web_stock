require 'spec_helper'

describe "scraping_webs/index" do
  before(:each) do
    assign(:scraping_webs, [
      stub_model(ScrapingWeb,
        :name => "Name",
        :url => "Url",
        :html => "MyText",
        :facebook => 1,
        :twitter => 2,
        :hatena => 3,
        :timing => 4
      ),
      stub_model(ScrapingWeb,
        :name => "Name",
        :url => "Url",
        :html => "MyText",
        :facebook => 1,
        :twitter => 2,
        :hatena => 3,
        :timing => 4
      )
    ])
  end

  it "renders a list of scraping_webs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
