class Rental < ActiveRecord::Base
	belongs_to :user
	belongs_to :van
end
