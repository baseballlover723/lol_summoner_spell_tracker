class CreateSummonerSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :summoner_spells do |t|
      t.string :name
      t.string :image
      t.integer :cooldown

      t.timestamps
    end
  end
end
