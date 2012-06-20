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

require 'spec_helper'

describe Company do
  
	before do
		@attr = {:name => "Afrails Inc", :phone => "1888-009-9999"}
		@company = Factory(:address_for_company)
		#address = Factory(:address)
		#@company = Factory(:company, :address => address)
	end
	
	subject { @company }
	
	it {should respond_to(:name)}
	it { should respond_to(:phone)}
	it { should respond_to(:fax)}
	it {should respond_to(:website)}
	it {should respond_to (:address)}

	it { should be_valid }
	
	describe "when name is blank" do
		before {@company.name = ""}
		it {should_not be_valid }
	end
	
	describe "when address is blank" do
		before {@company.address_id = " "}
		it {should_not be_valid }
	end
end
