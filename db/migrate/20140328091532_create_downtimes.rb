class CreateDowntimes < ActiveRecord::Migration
  def change
    create_table :downtimes do |t|

      t.timestamps
    end
  end
end
