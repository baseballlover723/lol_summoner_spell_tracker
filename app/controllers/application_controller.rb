require 'lol'

class ApplicationController < ActionController::Base
  UPDATE_FREQUENCY = 24.hour
  @@last_update = LastUpdate.take || LastUpdate.create(time: Time.at(0))
  @@patch = '8.11.1'

  before_action :check_update

  def check_update
    now = Time.now
    return if @@last_update.time + UPDATE_FREQUENCY > now
    @@last_update.update(time: now)
    puts 'checking for updates'
    update_patch
    update_champions
    update_summoner_spells
    update_runes
    @@last_update.update(time: now)
  end

  def update_patch
    puts 'updating patch'
    versions = Global.static_client.static.versions.get
    @@patch = versions.first
  end

  def update_champions
    puts 'updating champions'
    champions = Global.static_client.static.champions.get(nil, {champListData: 'image'})
    champions.each do |champion_struct|
      champion = Champion.find_by(id: champion_struct.id) || Champion.new(id: champion_struct.id)
      image_url = Champion.image_url champion_struct.image['full'], Global.patch
      champion.update!(name: champion_struct.name, image: image_url)
    end
  end

  def update_summoner_spells
    puts 'updating summoner spells'
    summoner_spells = Global.static_client.static.summoner_spells.get(nil, {spellListData: ['cooldown', 'modes', 'image']})
    summoner_spells.each do |summoner_spell_struct|
      summoner_spell = SummonerSpell.find_by(id: summoner_spell_struct.id) || SummonerSpell.new(id: summoner_spell_struct.id)
      image_url = SummonerSpell.image_url summoner_spell_struct.image['full'], Global.patch
      cooldown = summoner_spell_struct.cooldown.first.to_i
      modes = GameMode.get_modes summoner_spell_struct.modes

      summoner_spell.update!(name: summoner_spell_struct.name, image: image_url, cooldown: cooldown, game_modes: modes)
    end
  end

  def update_runes
    puts 'updating runes'
    runes = reforged_runes
    runes.each do |rune_struct|
      rune = Rune.find_by(id: rune_struct.id) || Rune.new(id: rune_struct.id)
      image_url = Rune.image_url rune_struct.id, Global.patch
      summoner_spell_cdr = Rune.parse_summoner_spell_cdr(rune_struct)

      rune.update!(name: rune_struct.name, image: image_url, summoner_spell_cdr: summoner_spell_cdr)
    end
  end

  private

  def reforged_runes
    Global.static_client.static.reforged_runes.get
    # response = HTTParty.get("https://na1.api.riotgames.com/lol/static-data/v3/reforged-runes?api_key=#{Global.api_key}")
    # response.map {|obj| OpenStruct.new obj}
  end
end
