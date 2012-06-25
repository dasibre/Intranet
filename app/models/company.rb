# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  phone      :string(50)
#  fax        :string(50)
#  website    :string(255)
#  address_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
	has_many	:people
	belongs_to  :address
	has_and_belongs_to_many :categories
	validates :name, 	 :presence => true
	validates_associated :address
	validates :address,  :presence => true

end
