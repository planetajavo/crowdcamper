class AddUserRefToVan < ActiveRecord::Migration
  def change
    add_reference :vans, :user, index: true
  end
end
