class AppointmentsController < ApplicationController

  def index
  end

  def new
  	@appointment = Appointment.new
    @subject = [['Agricultural, Life and Environmental Sciences'],['Arts'],['Augustana Faculty Library'],['Business, School of'],['Campus Saint-Jean'],['Education'],\
            ['Engineering'],['Law'],['Library and Information Studies, School of'],['Medicine and Dentistry'],['Native Studies'],['Nursing'], ['Pharmacy and Pharmaceutical Sciences'],\
            ['Physical Education and Recreation'], ['Rehabilitation Medicine'], ['School of Public Health'], ['Science'], ['Interdisciplinary Collections and Subjects']]

   render 'appointments/book'
  end

end