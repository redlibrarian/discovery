class AppointmentSubject < ActiveRecord::Base

  attr_reader :id, :subject, :email

   has_many :appointments


end
