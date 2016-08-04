class AppointmentsController < ApplicationController

  def index
  end

  def show

    render action: 'success'
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Appointment has been saved'
      redirect_to appointment_url(@appointment)   # short for redirect_to appointment_url(@appointment) see chapter 7.4.1 in railstutorial.org
    else
      @subject = AppointmentSubject.order(:subject)
      render 'appointments/book'
    end

  end

  def new
    @appointment = Appointment.new
=begin
        @subject = [['Agricultural, Life and Environmental Sciences'],['Arts'],['Augustana Faculty Library'],['Business, School of'],['Campus Saint-Jean'],['Education'],\
        ['Engineering'],['Law'],['Library and Information Studies, School of'],['Medicine and Dentistry'],['Native Studies'],['Nursing'], ['Pharmacy and Pharmaceutical Sciences'],\
        ['Physical Education and Recreation'], ['Rehabilitation Medicine'], ['School of Public Health'], ['Science'], ['Interdisciplinary Collections and Subjects']]
=end

    @subject = AppointmentSubject.order(:subject)

    render action: 'book'
  end


  private

  def appointment_params
    params.require(:appointment).permit(:name, :email,  :one_card,  :best_times,   :topic, :subject, :sent_to, :assigned, :department )
  end

end