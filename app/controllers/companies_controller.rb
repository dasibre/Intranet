class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
		@address = Address.new
	end

	def edit
		@company = Company.find(params[:id])
		@address = @company.address
	end

	def create
		@company = Company.new(params[:company])
		@company.address = Address.from_street_1_and_zip(params[:address])
		@address = @company.address || Address.new
		if @company.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		@company = Company.find(params[:id])
		@company.address = Address.from_street_1_and_zip(params[:address])
		@address = @company.address || Address.new
		if @company.update_attributes(params[:company])
			redirect_to root_path
			flash[:notice]= "person updated"
		else
			render 'edit'
		end
	end
end
