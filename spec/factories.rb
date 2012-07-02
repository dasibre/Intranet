Factory.define :person do |person|
	person.title			"Mr"
	person.first_name		"Kwame"
	person.last_name		"black"
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
	address.street_1	 "123 bell street"
	address.street_2	 "Apt 3b"
	address.city		 "Queens"
	address.state		 "NY"
	address.zip		 "11364"
end		

Factory.define :company do |company|
	company.name		"Afrails"
	company.phone		"888-222-2222"
	company.fax		"222-222-2233"
	company.website		"www.afrails.com"
	company.association	:address
end

Factory.define :address_for_company, :parent => :company do |company|
	company.after_create { |comp| Factory(:address, :company => comp) }
end

