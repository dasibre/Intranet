require 'spec_helper'

describe PeopleController do

	#render_views

  describe "GET 'index'" do
  	before do
  		#@person = Factory(:person)
  		get :index

  	end
  	subject { controller }

  	it { should assign_to(:people)}
    it { should assign_to(:people).with_kind_of(Array) }
    #it { should render_template(:index)}
  end

  describe "Get 'show'" do
  	before do
  		@person = Factory(:person, :email => "foo@example.com")
  		get :show, :id => @person
  	end

  	it { should assign_to(:person) }
    it { should render_template(:show)}
  	it { should respond_with(:success)}
  end

  describe "Get 'new'" do
    before { get :new }

    it { should respond_with(:success)}
  end

end
