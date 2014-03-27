class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string   "name"
	    t.string   "country"
	    t.string   "city"
	    t.string   "street"
	    t.integer  "number"

      t.timestamps
    end
  end
end
