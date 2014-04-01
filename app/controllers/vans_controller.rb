class VansController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

	def index
			if params[:search] && params[:search][:Lugar] != ''
				@lugar = params[:search][:Lugar]
				@vans = Location.search_by_city(@lugar).map(&:van)
			else
				@vans = Van.all 
			end
	end

	def show 
		@van = Van.find(params[:id])
		
	end

	def new 
		@van = Van.new
		@van.images.build 
		@van.locations.build
	end

	def create
		@van = Van.new(van_params)
		@van.user = current_user
		@van.save
		redirect_to van_path(@van.id)
	end

	def edit
		@van = Van.find(params[:id])
		@van.images.build
	end

	def update
		
		@van = Van.find(params[:id])
		@van.update(van_params)
		redirect_to van_path(@van.id)

	end

	def destroy
		@van = Van.find(params[:id])
		@van.destroy
		redirect_to vans_url
	end

	private

	def van_params
	  params.require(:van).permit(:brand, :model, :year, :description, :price, images_attributes: ['image'], locations_attributes: ['city'])
	end
end
