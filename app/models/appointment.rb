class Appointment < ActiveRecord::Base

	belongs_to :appointment_subject , class_name: 'AppointmentSubject', foreign_key: :subject_id

	#attr_accessible :name, :email, :one_card, :best_times, :topic, :area, :subject_id, :sent_to, :assigned, :department




	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  	validates :name,  presence: true, length: { maximum: 50 }

    validates :subject_id, presence: {message: "Subject is required"}
   # validates :appointment_subject, presence: {message: "Appointment Subject is required"}

		validates :best_times,  presence:   {message: "Best Times is required"}
	  validates :one_card,  presence:   {message: "One Card is required"}
  	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

   # validate :validate_subject_id

    # validates_presence_of  :subject_id ,message: "Subject can not be blank"



  private

	def validate_subject_id
		errors.add(:subject_id, "is invalid") unless AppointmentSubject.exists?(self.subject_id)
	end



end