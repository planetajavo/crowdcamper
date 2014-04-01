class AddRefsToRentals < ActiveRecord::Migration
  def change
  	  add_reference :rentals, :user, index: true
  	  add_reference :rentals, :van, index: true
  end
end
