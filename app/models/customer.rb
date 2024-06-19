class Customer < ApplicationRecord
	belongs_to :theatre, optional:true
	belongs_to :movie, optional:true

#---------------------------- new work ------------------------------ 
	before_save :downcase_email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness:true ,format: { with: VALID_EMAIL_REGEX }


	PASSWORD_REGEX = /\A (?=.{6,})(?=.*\d)(?=.*[a-z])/x
  	has_secure_password
  	validates :password, length: { minimum: 6 }, allow_blank: true , :format => {:with => PASSWORD_REGEX, message: "at least 6 characters and must include one number and one letter."},unless: Proc.new { |a| a.password.blank? }

	def downcase_email
		self.email = email.downcase
	end

end
