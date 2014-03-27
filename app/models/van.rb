class Van < ActiveRecord::Base
	has_many :locations
	has_many :pics
end
