class VansController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

	def index
			if params[:search] && params[:search][:city]
				@vans = Location.search_by_city(params[:search][:city]).map(&:van)
			else
				@vans = Van.all 
			end
	end

	def show 
		@van = Van.find(params[:id])
		
	end

	def new 
		@van = Van.new
		1.times { @van.images.build }
	end

	def create
		@van = Van.new(van_params)
		@van.user = current_user
		@van.save
		redirect_to van_path(@van.id)
	end

	def edit
		@van = Van.find(params[:id])
	end

	def update
		
		@van = Van.find(params[:id])
		@van.update(van_params)
	end

	def destroy
		@van = Van.find(params[:id])
		@van.destroy
		redirect_to vans_url
	end

	private

	def van_params
	  params.require(:van).permit(:brand, :model, :year, :description, :price, images_attributes: ['image'])
	end
end
