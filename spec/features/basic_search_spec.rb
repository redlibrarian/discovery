require_relative "../rake_helper"
require_relative "../spec_helper"

include RakeTasks

initialize_rake_tasks
delete_solr_index
ingest_all_test_sets

RSpec.feature "Basic Search", :type => :feature do
  scenario "User does a simple search" do
    visit "/results"

    expect(page).to have_text("18 results for")

    fill_in "q", :with => "accountancy"
    click_button "search"

    expect(page).to have_text("6 results for accountancy")

    fill_in "q", :with => "agricola"
    click_button "search"

    expect(page).to have_text("1 results for agricola")

  end
end

