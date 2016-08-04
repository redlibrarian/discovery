class CreateAppointmentSubjects < ActiveRecord::Migration
  def change
    create_table :appointment_subjects do |t|
      t.string :subject
      t.string :library_email
    end
  end
end
