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

	ZIP_REGEX = /(^\d{5}(-\d{4})?$)|(^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$)/i
	validates :street_1, :presence => true
	validates :zip, :format => { :with => ZIP_REGEX }


	def self.from_street_1_and_zip(params)
		params ||= {}
		street_1 = params[:street_1]
		zip = params[:zip]
		if street_1.blank? and zip.blank?
			address = nil
		else
			address = find_or_initialize_by_street_1_and_zip(street_1, zip)
			address.attributes = params
		end
		address
	end




end
