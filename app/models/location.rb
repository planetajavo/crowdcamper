class Location < ActiveRecord::Base
	belongs_to :van

	scope :search_by_city, lambda { |city| 
		where(city: city)
	}
end
