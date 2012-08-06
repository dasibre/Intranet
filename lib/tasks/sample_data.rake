require 'faker'

namespace :db do
	desc "FIll database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		make_people
		make_addresses
		#make_relationships
	end
end

def make_people
	genders = ["M", "F"].each do |g|
		20.times do
		person = Person.create!(
		:first_name => Faker::Name.first_name,
		:last_name => Faker::Name.last_name,
		:email => Faker::Internet.email,
		:gender => g)
		#:address_id => Address.create!(
			#:street_1 => Faker::Address.street_address,
			#:city => Faker::Address.city,
			#:state => Faker::Address.us_state_abbr,
			#:zip => Faker::Address.zip_code))

		end
	end
	
end

def make_addresses
	Person.all.each do |person|
		person.build_address(:street_1 => Faker::Address.street_address,
                             :city => Faker::Address.city,
                             :state => Faker::Address.us_state_abbr,
                             :zip => Faker::Address.zip_code)
		person.save
	end
end

#def make_user
	#person = Person.create!(:first_name => "Example User", :last_name => "Black", 
											  #:email => "example@ex.com",
											 # :gender => "F",
											 # :password_confirmation => "foobar")
		#admin.toggle!(:admin)
		#99.times do |n|
		#	f_name = Faker::Name.first_name
		#	l_name = 
		#	email = "example-#{n+1}@railstutorial.org"
		#	password = "password"
		#	User.create!(:name =>name,
						# :email => email,
						# :password => password,
						# :password_confirmation => password)
		#end
#end

#def make_microposts
#	User.all(:limit => 6).each do |user|
#			50.times do
#				user.microposts.create!(:content => Faker::Lorem.sentence(5))
#			end
#		end
#end

#def make_relationships
	#users = User.all
	#user = users.first
	#following = users[1..50]
	#followed = users[3..40]
	#following.each {|followed| user.follow!(followed)}
	#followers.each {|follower| follower.follow!(user)}
#end