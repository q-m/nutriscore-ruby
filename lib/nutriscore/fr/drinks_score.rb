require_relative '../common/score'
require_relative 'concerns/drinks_score_class'

module Nutriscore
  module FR
    # this is for drinks
    class DrinksScore < Nutriscore::Common::Score
      include DrinksScoreClass

      def self.nutrient_keys
        [:energy, :sugar, :fruits_vegetables]
      end

      def energy
        value = @nutrients.energy
        if   !value        then nil
        elsif value ==   0 then  0
        elsif value <=  30 then  1
        elsif value <=  60 then  2
        elsif value <=  90 then  3
        elsif value <= 120 then  4
        elsif value <= 150 then  5
        elsif value <= 180 then  6
        elsif value <= 210 then  7
        elsif value <= 240 then  8
        elsif value <= 270 then  9
        else                    10
        end
      end

      def sugar
        value = @nutrients.sugar
        if   !value        then nil
        elsif value == 0   then  0
        elsif value <  1.5 then  1
        elsif value <  3   then  2
        elsif value <  4.5 then  3
        elsif value <  6   then  4
        elsif value <  7.5 then  5
        elsif value <  9   then  6
        elsif value < 10.5 then  7
        elsif value < 12   then  8
        elsif value < 13.5 then  9
        else                    10
        end
      end

      def fruits_vegetables
        # the text mentions % but here we use g/100ml
        # we'd need to either ask for %, ask for g/100g, or require a density ...
        value = @nutrients.fruits_vegetables
        if   !value   then nil
        elsif value > 80 then 10
        elsif value > 60 then  4
        elsif value > 40 then  2
        else                   0
        end
      end
    end
  end
end
