class CreateSummoners < ActiveRecord::Migration[5.2]
  def change
    create_table :summoners do |t|
      t.string :username
      t.integer :summoner_id
      t.integer :region

      t.timestamps
    end
  end
end
