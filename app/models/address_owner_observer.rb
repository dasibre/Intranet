class AddressOwnerObserver < ActiveRecord::Observer
	observe Person, Company

	def after_destroy(record)
		unless record.address_id.blank?
			address = Address.find record.address_id
			if address.people.empty? and address.company.nil?
				address.destroy
			end
		end
	end
end