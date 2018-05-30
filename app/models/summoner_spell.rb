class SummonerSpell < ApplicationRecord
  has_and_belongs_to_many :game_modes

  BASE_IMAGE_URL = 'http://ddragon.leagueoflegends.com/cdn/<patch>/img/spell/'

  def self.image_url(path, patch)
    BASE_IMAGE_URL.sub('<patch>', patch) + path
  end
end
