class Person < ActiveRecord::Base

	email_regex = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :format => { :with => email_regex}
	GENDER = { 'M' => 'MALE', 'F' => "FEMALE"}
	validates :gender, :inclusion => {:in => GENDER.keys }
	
	def full_name
		"#{first_name} #{last_name}"
	end
end
