class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
    	t.datetime "start_at"
    	t.datetime "end_at"	
    	t.string "status"
      t.timestamps
    end
  end
end
