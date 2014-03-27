class VanController < ApplicationController

	def index
		@vans = Van.all 
	end

	def show 
		@van = Van.find(params[:id])
	end

	def new 
		@van = Van.new
	end

	def create
		@van = Van.create(van_params)
		redirect_to van_path(@van.id)
	end

	def edit
		@van = Van.find(params[:id])
	end

	def update
		@van.update(van_params)
	end

	def destroy
		@van.destroy
		redirect_to vans_url
	end

	private

	def van_params
	  params.require(:van).permit(:brand, :model, :year )
	end




end
