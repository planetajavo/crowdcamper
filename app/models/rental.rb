class Rental < ActiveRecord::Base
	belongs_to :user
	belongs_to :van
	belongs_to :referred_by, :class_name => 'Unavailability'
	after_initialize :init

	def init
		self.status ||= 'pending'
	end
end
