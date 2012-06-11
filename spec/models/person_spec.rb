require 'spec_helper'

describe Person do
	
	before { @person = Person.new(:first_name => "Joe", :last_name => "smith", :email => "jsmith@ex.com") }
	
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

end
