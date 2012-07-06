require 'spec_helper'

describe PeopleController do

	#render_views

  describe "GET 'index'" do
  	before { get :index }

  	it { should assign_to(:people)}
    it { should assign_to(:people).with_kind_of(Array) }
    it { should render_template(:index)}
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
    it { should render_template(:new) }
  end

  describe "Post create" do
    context "with valid attributes" do
      let(:person) { Factory.attributes_for(:person) }
      it "creates a new person" do
        expect { post :create, person: person }.to change(Person, :count).by(1)
      end
    end
  
    context "with invalid attributes" do
      let(:person) {Factory.build(:person, :first_name => "")}
      it "creates a new person" do
        expect { post :create, person: person}.to_not change(Person, :count)
      end
    end
  end

end
