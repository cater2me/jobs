require 'spec_helper'

feature 'Feed Index' do
  given!(:feed1) { FactoryGirl.create(:feed) }
  it 'renders the Feed Index template into $rootEl', js: true do
    visit '#'
    expect(page).to have_content("News")
  end

end
