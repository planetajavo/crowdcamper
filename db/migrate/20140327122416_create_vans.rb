class CreateVans < ActiveRecord::Migration
  def change
    create_table :vans do |t|
    	t.string   "brand"
    	t.string   "model"
    	t.string   "year"
    	t.decimal  "price"
      t.timestamps
    end
  end
end
