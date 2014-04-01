class RentalsController < ApplicationController
	def create
		@rental = Rental.new(rental_params)
		@rental.van =  Van.find(params[:id])
		@rental.user = current_user
		@rental.status = 'pending'
		@rental.save
		redirect_to rentals_van_path(@rental.van.id, @rental.id)
	end

	def show
		@rental = Rental.find(params[:rental_id])
	end

	private

	def rental_params
		params.permit(:start_at, :end_at)
	end
end
