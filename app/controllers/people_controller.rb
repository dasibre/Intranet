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

end
