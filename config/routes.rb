Rails.application.routes.draw do
  # get 'api/live_game'
  root to: 'home#index'
  get '/:region/:username', to: 'main#live_game', as: :live_game

  scope :api do
    scope :v1 do
      get 'live_game/:region/:username', to: 'api#live_game'
    end
  end
end
