require_relative 'drinks_score'
require_relative 'concerns/mineral_water_score_class'

module Nutriscore
  module FR
    class MineralWaterScore < DrinksScore
      include MineralWaterScoreClass
    end
  end
end
