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

require 'spec_helper'

describe Person do
	
	before do 
		@attr = {:first_name => "Joe", :last_name => "Smith", :email => "jsmith@foo.com", :gender => "M"}
		#@person = Person.new(@attr)
		@person = Factory(:person)
	end
	
	subject { @person }

	it { should respond_to(:title)}
	it { should respond_to(:first_name)}
	it { should respond_to(:last_name)}
	it { should respond_to(:email)}
	it { should respond_to(:work_phone)}
	it { should respond_to(:mobile)}
	it { should respond_to(:job_title)}
	it { should respond_to(:gender)}
	it { should respond_to(:keywords)}
	it { should respond_to(:notes)}
	it { should respond_to(:address_id)}
	it { should respond_to(:company_id)}
	it { should respond_to(:full_name)}

	it { should be_valid }

	describe "when first_name is blank" do
		before { @person.first_name = " "}
		it { should_not be_valid}
	end

	describe "when last_name is blank" do
		before {@person.last_name = " "}
		it { should_not be_valid}
	end


	describe "when email is blank" do
		before {@person.email = " "}
		it { should_not be_valid}
	end

	describe "when email is already taken" do
		it "should not create new user" do
			Person.create!(@attr)
			user_with_same_email = Person.new(@attr)
			user_with_same_email.save
			user_with_same_email.should_not be_valid
		end

		#it { should_not be_valid}
		it "should be invalid" do
			@attr = {:first_name => "Joe", :last_name => "Smith", :email => "jsmith@foo.com", :gender => "M"}
			Person.create!(@attr)
			user_with_same_email = Person.new(@attr)
			user_with_same_email.should_not be_valid
		end
		#it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w(user@foo,com user_at_foo.com example.user@foo. foo@bar_baz.com)
			addresses.each do |invalid| 
				@person.email = invalid
				@person.should_not be_valid
			end
		end
	end

	describe "when gender is not included" do
		it "should be invalid" do
			person = Person.new(@att)
			person.gender = " "
			person.should_not be_valid
		end
	end
	
	describe "when associated address is invalid" do
		it "should be invalid" do
			person = Person.new(@attr)
			addr   = Address.new
			person.address = addr
			person.save
			person.should_not be_valid
		end
	end
	
	describe "when associsated address is valid" do
		it "should be valid" do
			person = Person.new(@attr)
			addr = Factory(:address)
			person.address = addr
			person.save
			person.should be_valid
		end
	end

	describe "when associated person address not set" do
		it "should not be valid" do
		person = Factory(:person, :email => "kmasters@foo.com")
		addr = Address.new(:street_1 => "")
		person.address = addr
		person.save
		person.should_not be_valid
		end
	end

	describe "when associated person address is set" do
		it "should be valid" do
		person = Factory(:person, :email => "kmasters@foo.com")
		addr = Address.new(:street_1 => "7402 bell blvd", :zip => "11111")
		person.address = addr
		person.save
		person.should be_valid
		end
	end

end
