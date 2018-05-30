class GameMode < ApplicationRecord
  has_and_belongs_to_many :summoner_spells

  @@cached_modes = {} # {name: model}
  def self.get_modes(mode_strs)
    modes = []
    mode_strs.each do |mode_str|
      @@cached_modes[mode_str] ||= GameMode.find_or_create_by name: mode_str
      modes << @@cached_modes[mode_str]
    end
    modes
  end
end
