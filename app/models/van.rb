class Van < ActiveRecord::Base
	has_many :locations
	has_many :images
	has_many :unavailabilities

	mount_uploader :image, ImageUploader


end
