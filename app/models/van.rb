class Van < ActiveRecord::Base
	has_many :locations
	has_many :images
	has_many :rentals
	has_many :downtimes
	belongs_to :user

	accepts_nested_attributes_for :images, :locations

	scope :search_by_city, lambda { |city| 
		joins(:locations).where(['locations.city like ?',city])
	}

	scope :filter_by_rented, lambda { |start_at, end_at|
		joins(:rentals).where(['rentals.start_at <= ? AND rentals.end_at >= ?',end_at,start_at])
	}
	
	scope :filter_by_ocupants, lambda { |ocupants| 
		where(['capacity >= ?',ocupants])
	}

end
