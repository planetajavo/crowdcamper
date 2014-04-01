class VansController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

	def index
			@vans = vans_filtered
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

	def vans_filtered
		vans = Van.all
			if params[:search] 
				if params[:search][:Lugar] != ''
					@lugar = params[:search][:Lugar]
					vans = vans.search_by_city(@lugar)
				end

				if params[:search][:Inicio] != ''
					@inicio = params[:search][:Inicio]
				end

				if params[:search][:Fin] != ''
					@fin = params[:search][:Fin]
				end

				if @inicio && @fin
					ocuppied_vans = Van.filter_by_rented(@inicio,@fin)
				end

				if params[:search][:source_type] != ''
					@personas = params[:search][:source_type]
					vans = vans.filter_by_ocupants(@personas)
				end

				if ocuppied_vans
					vans = vans - ocuppied_vans
				end
			end
		vans
	end
end
