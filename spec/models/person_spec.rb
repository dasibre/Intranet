require 'spec_helper'

describe Person do
	
	before do 
		@attr = {:first_name => "Joe", :last_name => "smith", :email => "jsmith@ex.com", :gender => "M"}
		@person = Person.new(@attr)
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
		before do
			Person.new(@attr)
			user_with_same_email = Person.new(@attr)
			user_with_same_email.save
		end

		it { should_not be_valid}
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

end
