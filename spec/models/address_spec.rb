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

require 'spec_helper'

describe Address do
	  before do
		@address = Factory.build(:address)
	  end
	
	subject {@address}
	
	it {should be_valid }
	
	it {should respond_to(:street_1)}
	it {should respond_to(:street_1)}
	it {should respond_to(:city)}
	it {should respond_to(:state)}
	it {should respond_to(:zip)}

	describe "when street_1 is blank" do
		before{@address.street_1 = " " }
		it {should_not be_valid}
	end
	
	describe "when zip code is blank" do
		before{@address.zip = "" }
		it {should_not be_valid}	
	end
	
	describe "when zip code format is incorrect" do
		it "should not be valid" do
		wrong_zip_code = %w(as123 %23344 111298800)
			wrong_zip_code.each do |zip|
			@address.zip = zip
			end
		@address.should_not be_valid
		end
	end
	
	describe "when valid zip code" do
		it "should be valid" do
			valid_zip_code = %w(10450 11364 90210-1111)
			valid_zip_code.each do |zip|
				@address.zip = zip
			end
		@address.should be_valid
		end
	end
end	
