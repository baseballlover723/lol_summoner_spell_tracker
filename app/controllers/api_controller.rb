class ApiController < ApplicationController
  def live_game
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

end
