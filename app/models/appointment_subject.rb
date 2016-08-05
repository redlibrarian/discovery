class AppointmentSubject < ActiveRecord::Base

 # attr_reader :id, :subject, :library_email

   has_many :appointments


end
