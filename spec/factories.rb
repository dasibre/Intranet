Factory.define :person do |person|
	person.title		 "Mr"
	person.first_name	 "Black"
	person.last_name	 "Irish"
	person.email		 "birish@example.com"
	person.work_phone	 "914-738-7386"
	person.mobile		 "302-229-7084"
	person.job_title	 "Web developer"
	person.gender		 "M"
	person.keywords		 "web, dev"
	person.notes		 "Mr irish is a morning person"	 	
	person.association	 :address
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
