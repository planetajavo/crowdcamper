class Van < ActiveRecord::Base
	has_many :locations
	has_many :images
	has_many :unavailabilities
	belongs_to :user

	mount_uploader :image, ImageUploader


end
