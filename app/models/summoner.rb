class Summoner < ApplicationRecord
  attr_accessor :champion # Champion
  attr_accessor :summoner_spell_f, :summoner_spell_d # SummonerSpell
  attr_accessor :summoner_spell_cdr # int

  def self.create_or_update(region, username, summoner_id)
    identifing_attributes = {region: region, summoner_id: summoner_id}
    db_summoner = Summoner.find_by(identifing_attributes) || Summoner.new(identifing_attributes)
    db_summoner.update!(username: username)
    db_summoner
  end

  def self.find_by_username(region, username)
    db_summoner = Summoner.find_by region: region, username: username
    # TODO reupdate if out of date
    if db_summoner.nil?
      db_summoner = fetch_summoner region, username
    end
    db_summoner
  end

  def self.fetch_summoner(region, username)
    client = Global.client
    summoner_struct = client.summoner.find_by_name username
    Summoner.create_or_update(region, summoner_struct.name, summoner_struct.id)
  end

  def attributes
    super.merge(
      champion: champion,
      summoner_spell_f: summoner_spell_f,
      summoner_spell_d: summoner_spell_d,
      summoner_spell_cdr: summoner_spell_cdr
    )
  end

  def get_live_game
    client = Global.client
    LiveGame.new client.spectator.current_game(summoner_id: summoner_id), client.region, self
  end
end
