class PeopleController < ApplicationController
  
  def index
  	@title = 'Home page'
  	@people = Person.find_all_ordered
	#render 'index'
  end

  def show
  	@person = Person.find(params[:id])
  	@title = "#{@person.full_name} + Profile"
  end

  def new
	   @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
        redirect_to @person, :flash => { :notice => "New customer added" }
    else
      flash.now[:error] = "Fill all required fields"
      render 'new'
    end
  end

end
