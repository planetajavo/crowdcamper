class Van < ActiveRecord::Base
	has_many :locations
	has_many :images

	mount_uploader :avatar, AvatarUploader

	
end
