class AppointmentMailer < ActionMailer::Base

  default from: "libwebms@ualberta.ca"
  layout 'mailer'

  def appointment_email(appointment, message)
    #params.require(:appointment).permit(:subject_id)


    @library_email = AppointmentSubject.select(:library_email).where(:subject_id => params[:subject_id] )
    @appointment = appointment

    mail(to: @appointment.email, subject: 'New Appointment', template_path: 'appointments/mailer', template_name: 'success_email')
  end

end