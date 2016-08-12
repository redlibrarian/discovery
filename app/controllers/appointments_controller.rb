class AppointmentsController < ApplicationController

  def index
  end

  def show

    render action: 'success'
  end

  def create
    appointment_params = params.require(:appointment).permit(:subject_id, :name, :email, :one_card, :best_times, :topic, :department)
    @appointment = Appointment.new(appointment_params)


   # logger.debug "New appointment: #{@appointment.inspect}"



    if @appointment.save

      #AppointmentMailer.create_appointment_email(@appointment)

      flash[:success] = 'Appointment has been saved'
      redirect_to appointment_url(@appointment)   # short for redirect_to appointment_url(@appointment) see chapter 7.4.1 in railstutorial.org
    else
      @subject = AppointmentSubject.order(:subject)
      render 'appointments/book/'
    end

  end

  def new
    # AppointmentMailer.sample_email(Appointment.first)

    @appointment = Appointment.new

    @subject = AppointmentSubject.order(:subject)

    render action: 'book'
  end


  private

  def appointment_params
    params.require(:appointment).permit(:name, :email,  :one_card,  :best_times,   :topic, :subject, :sent_to, :assigned, :department )
  end

end