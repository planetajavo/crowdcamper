class RentalsController < ApplicationController
	def create #has post data
		@rental = create_rental_from_params(params)
		send_confirmation_email
		render 'rentals/waiting_approval.html'
	end

	def confirm
		@rental = find_rental_with_id(params[:rental_id])
		@rental.confirm
		save_rental
		send_approvation_email
		render 'rentals/approved.html'
	end

	def show
		@rental = Rental.find(params[:rental_id])
	end

	def new
		@start_at = params[:start_at]
		@end_at = params[:end_at]
		@van_id = params[:id]
		render 'rentals/new.html'
	end

	private

	def rental_params
		params.permit(:start_at, :end_at)
	end

	def create_rental_from_params(params)
		@rental = Rental.new(rental_params)
		@rental.van =  Van.find(params[:id])
		@rental.user = current_user
		@rental.save
		
		@rental
	end

	def send_confirmation_email
		#TODO: make this work
		email_content = render('email/confirmation.html')
		send_email_to(rental.van.user.email, email_content)
	end

	def send_approvation_email
		email_content = render('email/approval.html')
		send_email_to(rental.user.email)
	end

	def find_rental_with_id(id)
		Rental.find(id)
	end

	def save_rental(rental)
		rental.save
	end
end
