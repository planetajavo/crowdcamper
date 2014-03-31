class Image < ActiveRecord::Base
	belongs_to :van
	mount_uploader :image, ImageUploader
	
end
