class CreateVans < ActiveRecord::Migration
  def change
    create_table :vans do |t|
    	t.string   "brand"
    	t.string   "model"
    	t.integer  "year"
    	t.decimal  "price"
    	t.text     "description"
      t.integer  "capacity"
      t.timestamps
    end
  end
end
