class AddVanRefToUnavailability < ActiveRecord::Migration
  def change
    add_reference :unavailabilities, :van, index: true
  end
end
