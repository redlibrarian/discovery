require_relative "../spec_helper.rb"

RSpec.describe AppointmentSubject, type: :model do

  it "has 1 french record in the table" do
      subject_french = AppointmentSubject.where(subject: 'Campus Saint-Jean')
      expect(subject_french).to exist
  end
end
