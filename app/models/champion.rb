class Champion < ApplicationRecord
  BASE_IMAGE_URL = 'http://ddragon.leagueoflegends.com/cdn/<patch>/img/champion/'

  def self.image_url(path, patch)
    BASE_IMAGE_URL.sub('<patch>', patch) + path
  end
end
