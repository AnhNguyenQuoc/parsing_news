require 'spec_helper'

describe "index feature", type: :feature do
  before :each do
    ParsingDataService.parsing_hacker_news
  end

  @javascript
  it "show index and click next_page" do
    visit '/'
    page.all('ul#articles_table li').count.should <= 30

    expect(page).not_to have_css('#btn-prev')
    find('#btn-next').click
    expect(page).to have_css('#btn-prev')
  end
end
