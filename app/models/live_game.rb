class LiveGame
  attr_accessor :raw, :region, :current_summoner, :enemy_team_id
  def initialize(live_game_struct, region, current_summoner)
    @json = {}
    @raw = live_game_struct
    @region = region
    @current_summoner = current_summoner
    @enemy_team_id
    set_enemy_team_id
    process_summoners
  end

  def method_missing(meth, *args)
    if @raw.respond_to?(meth)
      @raw.send(meth, *args)
    else
      super
    end
  end

  def respond_to?(meth)
    @raw.respond_to?(meth)
  end

  def to_json(options={})
    @json.to_json(options)
  end

  private

  def process_summoners
    summoners = []
    @raw.participants.each do |participant|
      puts participant
      summoner = Summoner.create_or_update @region, participant.summoner_name, participant.summoner_id
      if (participant.team_id == @enemy_team_id)
        summoner.champion = Champion.find participant.champion_id
        summoner.summoner_spell_d = SummonerSpell.find participant.spell1_id
        summoner.summoner_spell_f = SummonerSpell.find participant.spell2_id
        summoner.summoner_spell_cdr = participant.perks.perk_ids.sum do |rune_id|
          Rune.find(rune_id).summoner_spell_cdr
        end

        summoners << summoner
      end
    end

    @json[:summoners] = summoners
  end

  def set_enemy_team_id
    @raw.participants.each do |participant|
      @enemy_team_id = participant.team_id == 100 ? 200 : 100 if participant.summoner_id == @current_summoner.summoner_id
    end
  end
end
