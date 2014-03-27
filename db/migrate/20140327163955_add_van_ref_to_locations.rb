class AddVanRefToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :van, index: true
  end
end
