class Appointment < ActiveRecord::Base
	
	#attr_accessor :name, :email, :one_card, :best_times, :topic, :area, :subject, :sent_to, :assigned, :department

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  	validates :name,  presence: true, length: { maximum: 50 }
  	validates :email, presence: true, length: { maximum: 255 },
    				  format: { with: VALID_EMAIL_REGEX }


end
