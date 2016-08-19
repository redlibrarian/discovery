class AppointmentMailer < ActionMailer::Base

  default from: "libwebms@ualberta.ca"
  layout 'mailer'

  def appointment_email(appointment, email_to)


    @appointment = appointment
    mail(to: email_to, subject: 'New Library Appointment', template_path: 'appointments/mailer', template_name: 'success_email')


  end

end