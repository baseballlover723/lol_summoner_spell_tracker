class CreateLastUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :last_updates do |t|
      t.datetime :time
    end
    LastUpdate.create(time: Time.at(0))
  end
end
