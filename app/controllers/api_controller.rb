class ApiController < ApplicationController
  def live_game
    render json: params
  end
end
