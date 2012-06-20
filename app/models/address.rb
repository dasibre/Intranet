# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street_1   :string(255)      not null
#  street_2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(5)
#  created_at :datetime
#  updated_at :datetime
#

class Address < ActiveRecord::Base
	
	has_many :people
	has_one	 :company
	
	validates :street_1, :presence => true
	validates :zip, :presence => true

	def validate_on_create
		if Address.find_by_street_1(street_1)
		puts "already taken"
		#model_instance.errors[:base] << "address already taken"
		end
	end
end
