require_relative "../spec_helper"

RSpec.feature "Appointment", :type => :feature do
  scenario "User makes appointment with best times blank" do
    visit "/appointments"

    fill_in "appointment_name", :with => "Mr. Test"
    fill_in "appointment_email", :with => "jeremy.hennig@ualberta.ca"
    fill_in "appointment_one_card", :with => "1234567890123"

    click_button "Request Appointment"

    expect(page).to have_text("Best Times is required")



  end
end

