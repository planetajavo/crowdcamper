class Rental < ActiveRecord::Base
	after_initialize :default_values

	def default_values
		self.status = 'pending' unless self.status
	end

	belongs_to :user
	belongs_to :van

	def confirm
		self.status = 'confirmed'
	end

	def confirmed?
		self.status.to_sym === :confirmed
	end
end
