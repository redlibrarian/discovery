class Appointment < ActiveRecord::Base
	establish_connection DB_RESERVEREQUEST
	belongs_to :appointment_subject , class_name: 'AppointmentSubject', foreign_key: :subject_id


	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  	validates :name,  presence: true, length: { maximum: 50 }

    validates :subject_id, presence: {message: "Subject is required"}
   # validates :appointment_subject, presence: {message: "Appointment Subject is required"}

		validates :best_times,  presence: {message: "Best Times is required"}, length: { maximum: 255, message: "Best times cannot exceed %{count} characters" }
	  validates :one_card,  presence:   {message: "One Card is required"}, length: { maximum: 13, message: "One card must be a maximum of 13 characters" }
  	validates :email, presence: {message: "A valid email is required"}, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

    validate :validate_subject_id

    # validates_presence_of  :subject_id ,message: "Subject can not be blank"



  private

	def validate_subject_id
		errors.add(:subject_id, "Subject is invalid") unless AppointmentSubject.exists?(self.subject_id)
	end



end