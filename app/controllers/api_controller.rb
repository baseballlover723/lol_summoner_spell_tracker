class ApiController < ApplicationController
  def live_game
    return render json: mock_response
    region = params[:region]
    username = params[:username]
    current_summoner = Summoner.find_by_username region, username
    begin
      live_game = current_summoner.get_live_game
    rescue Lol::NotFound
      return render status: 404, plain: "#{current_summoner.username} in #{current_summoner.region} is not in a game"
    end
    render json: live_game
  end

  def mock_response
    {"summoners":[{"id":63,"username":"Pshrimp","summoner_id":43547300,"region":"na","created_at":"2018-06-07T05:13:29.307Z","updated_at":"2018-06-07T05:13:29.307Z","champion":{"id":15,"name":"Sivir","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/champion/Sivir.png","created_at":"2018-06-06T01:42:32.611Z","updated_at":"2018-06-06T01:42:32.611Z"},"summoner_spell_f":{"id":4,"name":"Flash","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerFlash.png","cooldown":300,"created_at":"2018-06-06T01:42:33.492Z","updated_at":"2018-06-06T01:42:33.492Z"},"summoner_spell_d":{"id":7,"name":"Heal","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerHeal.png","cooldown":270,"created_at":"2018-06-06T01:42:33.535Z","updated_at":"2018-06-06T01:42:33.535Z"},"summoner_spell_cdr":0.0},{"id":64,"username":"th3r1pper","summoner_id":87089542,"region":"na","created_at":"2018-06-07T05:13:29.326Z","updated_at":"2018-06-07T05:13:29.326Z","champion":{"id":555,"name":"Pyke","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/champion/Pyke.png","created_at":"2018-06-06T01:42:32.733Z","updated_at":"2018-06-06T01:42:32.733Z"},"summoner_spell_f":{"id":7,"name":"Heal","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerHeal.png","cooldown":270,"created_at":"2018-06-06T01:42:33.535Z","updated_at":"2018-06-06T01:42:33.535Z"},"summoner_spell_d":{"id":4,"name":"Flash","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerFlash.png","cooldown":300,"created_at":"2018-06-06T01:42:33.492Z","updated_at":"2018-06-06T01:42:33.492Z"},"summoner_spell_cdr":0.0},{"id":65,"username":"MangirthStrongja","summoner_id":23056315,"region":"na","created_at":"2018-06-07T05:13:29.341Z","updated_at":"2018-06-07T05:13:29.341Z","champion":{"id":122,"name":"Darius","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/champion/Darius.png","created_at":"2018-06-06T01:42:32.851Z","updated_at":"2018-06-06T01:42:32.851Z"},"summoner_spell_f":{"id":32,"name":"Mark","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerSnowball.png","cooldown":80,"created_at":"2018-06-06T01:42:33.513Z","updated_at":"2018-06-06T01:42:33.513Z"},"summoner_spell_d":{"id":4,"name":"Flash","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerFlash.png","cooldown":300,"created_at":"2018-06-06T01:42:33.492Z","updated_at":"2018-06-06T01:42:33.492Z"},"summoner_spell_cdr":0.05},{"id":66,"username":"Xrhaki","summoner_id":26378249,"region":"na","created_at":"2018-06-07T05:13:29.361Z","updated_at":"2018-06-07T05:13:29.361Z","champion":{"id":24,"name":"Jax","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/champion/Jax.png","created_at":"2018-06-06T01:42:32.526Z","updated_at":"2018-06-06T01:42:32.526Z"},"summoner_spell_f":{"id":14,"name":"Ignite","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerDot.png","cooldown":210,"created_at":"2018-06-06T01:42:33.619Z","updated_at":"2018-06-06T01:42:33.619Z"},"summoner_spell_d":{"id":4,"name":"Flash","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerFlash.png","cooldown":300,"created_at":"2018-06-06T01:42:33.492Z","updated_at":"2018-06-06T01:42:33.492Z"},"summoner_spell_cdr":0.0},{"id":67,"username":"LookAtThatPinch","summoner_id":41242625,"region":"na","created_at":"2018-06-07T05:13:29.375Z","updated_at":"2018-06-07T05:13:29.375Z","champion":{"id":26,"name":"Zilean","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/champion/Zilean.png","created_at":"2018-06-06T01:42:32.896Z","updated_at":"2018-06-06T01:42:32.896Z"},"summoner_spell_f":{"id":13,"name":"Clarity","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerMana.png","cooldown":240,"created_at":"2018-06-06T01:42:33.556Z","updated_at":"2018-06-06T01:42:33.556Z"},"summoner_spell_d":{"id":4,"name":"Flash","image":"http://ddragon.leagueoflegends.com/cdn/8.11.1/img/spell/SummonerFlash.png","cooldown":300,"created_at":"2018-06-06T01:42:33.492Z","updated_at":"2018-06-06T01:42:33.492Z"},"summoner_spell_cdr":0.0}]}
  end

end
