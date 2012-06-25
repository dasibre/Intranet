# == Schema Information
#
# Table name: people
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  first_name    :string(255)      not null
#  last_name     :string(255)      not null
#  email         :string(100)      not null
#  work_phone    :string(50)
#  mobile        :string(50)
#  job_title     :string(255)
#  gender        :string(1)
#  string        :string(1)
#  keywords      :string(255)
#  notes         :text
#  address_id    :integer
#  company_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  date_of_birth :date
#

class Person < ActiveRecord::Base
	#attr_accessible = :title, :first_name, :last_name, :email, :work_phone, :mobile, :job_title, :gender, :keywords, :notes 
	
	belongs_to :company
	belongs_to :address
	
	validates_associated :address, :company
	email_regex = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true, :uniqueness => true, :format => { :with => email_regex}
	GENDER = { 'M' => 'MALE', 'F' => "FEMALE"}
	validates :gender, :inclusion => {:in => GENDER.keys }
	
	def full_name
		"#{first_name} #{last_name}"
	end

	def self.find_all_ordered
		find(:all, :order => 'last_name, first_name')
	end
end
