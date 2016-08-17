class AppointmentSubject < ActiveRecord::Base

   establish_connection DB_RESERVEREQUEST


   has_many :appointments


end
