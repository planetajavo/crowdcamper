class Van < ActiveRecord::Base
	has_many :locations
	has_many :images
	has_many :rentals
	has_many :downtimes
	belongs_to :user

	accepts_nested_attributes_for :images, :locations


end
