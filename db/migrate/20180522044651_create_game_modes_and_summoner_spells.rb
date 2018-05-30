class CreateGameModesAndSummonerSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :game_modes do |t|
      t.string :name

      t.timestamps
    end

    create_table :summoner_spells do |t|
      t.string :name
      t.string :image
      t.integer :cooldown

      t.timestamps
    end

    create_table :game_modes_summoner_spells, id: false do |t|
      t.belongs_to :game_mode, index: true
      t.belongs_to :summoner_spell, index: true
    end
  end
end
