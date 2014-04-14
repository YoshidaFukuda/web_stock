require 'spec_helper'

describe "scraping_webs/show" do
  before(:each) do
    @scraping_web = assign(:scraping_web, stub_model(ScrapingWeb,
      :name => "Name",
      :url => "Url",
      :html => "MyText",
      :facebook => 1,
      :twitter => 2,
      :hatena => 3,
      :timing => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
