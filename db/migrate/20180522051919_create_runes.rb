class CreateRunes < ActiveRecord::Migration[5.2]
  def change
    create_table :runes do |t|
      t.string :name
      t.float :summoner_spell_cdr

      t.timestamps
    end
  end
end
