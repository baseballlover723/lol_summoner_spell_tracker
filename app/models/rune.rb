class Rune < ApplicationRecord
  BASE_IMAGE_URL = 'https://systeme-cardinal.fr/cdn/runesReforged/perk/'
  # BASE_IMAGE_URL = 'http://ddragon.leagueoflegends.com/cdn/<patch>/img/rune/'

  RUNES_LASTED_UPDATED_PATH = '8.11.1'
  RUNES_SUMMONER_SPELL_CDR = { # {name: cdr (0.05)}
                               'Cosmic Insight' => 0.05
  }

  def self.image_url(id, patch)
    # BASE_IMAGE_URL.sub('<patch>', patch) + path
    BASE_IMAGE_URL + id.to_s + '.png'
  end

  def self.parse_summoner_spell_cdr(rune_struct)
    RUNES_SUMMONER_SPELL_CDR[rune_struct.name] || 0
  end
end
