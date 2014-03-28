class AddVanRefToImages < ActiveRecord::Migration
  def change
    add_reference :images, :van, index: true
  end
end
