class PeopleController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_person, :only => [:show, :update, :edit]
  before_filter :get_companies, :only => [:edit, :new, :update, :create]

  def index
  	@title = 'Home page'
  	@people = Person.find_all_ordered
	#render 'index'
  end

  def show
  	@title = "#{@person.full_name} + Profile"
    if params[:destroy]
      render 'confirm_destroy' and return
    end
  end

  def new
	   @person = Person.new
     #@address = Address.new 
  end

  def create
    @person = Person.new(params[:person])
    @person.address = Address.from_street_1_and_zip(params[:address])
    @address = @person.address || Address.new
    if @person.save
        redirect_to @person, :flash => { :notice => "New customer added" }
    else
      flash.now[:error] = "Fill all required fields"
      render 'new'
    end
  end

  def edit
    @person.full_name
    @address = @person.address || Address.new
  end

  def update
    @person.address = Address.from_street_1_and_zip(params[:address])
    @address = @person.address
    if @person.update_attributes(params[:person])
      flash[:notice]= "Person successfully updated"
      redirect_to(@person)
    else
      render 'edit'
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    flash[:notice]= "Person deleted"
    redirect_to root_path
  end

  private

  def get_person
    @person = Person.find(params[:id])
  end

  def get_companies
    @companies = Company.find(:all, :order => 'name' )
  end

end
