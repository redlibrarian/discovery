require_relative "../spec_helper"

#test that the user can get to the french appointment page as it is dependant on a specific entry in the appointment_subjects table

RSpec.feature "French Appointment", :type => :feature do
  scenario "user can get to french appointment page" do
    visit "/fr/appointments"

     # puts page.body



   # page.find_css('#appointment_name').value.should eq ''

     # puts page.find(:css, '#appointment_subject_id', visible: false).value

    #page.should find("appointment_subject_id")

     expect(page).to have_selector(:css, '#appointment_subject_id', visible: false)


#    expect(page).to have_xpath("//input[@id='appointment_subject_id']")
#    page.find('input[@id=appointment_subject_id]')

    # page.find(:css, '#appointment_subject_id', visible: false)

    #page.find(:css, '#appointment_subject_id')



  end
end

