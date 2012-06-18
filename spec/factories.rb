Factory.define :person do |person|
	person.title			"Mr"
	person.first_name		"Kwame"
	person.last_name		"Nyame"
	person.email			"knyame@foo.com"
	person.work_phone		"555-555-5555"
	person.mobile			"333-333-3333"
	person.job_title		"web master"
	person.gender			"M"
	person.keywords			"web design dev"
	person.notes			"welcome to the beginning"
	person.association		:address
end

Factory.define :address do |address|
	address.street_1		"75-29 bell blvd"
	address.street_2		"apt 3b"
	address.city			"Oakland Gardens"
	address.state			"NY"
	address.zip             "10460"
end

Factory.define :company do |company|
	company.name 			"AfRails"
	company.address			{Factory(:address)}
	company.association		:address
end