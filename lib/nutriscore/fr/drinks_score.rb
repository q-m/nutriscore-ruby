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
        score_value(@nutrients.energy, 0..10) do |v|
          if    v ==   0 then  0
          elsif v <=  30 then  1
          elsif v <=  60 then  2
          elsif v <=  90 then  3
          elsif v <= 120 then  4
          elsif v <= 150 then  5
          elsif v <= 180 then  6
          elsif v <= 210 then  7
          elsif v <= 240 then  8
          elsif v <= 270 then  9
          else                10
          end
        end
      end

      def sugar
        score_value(@nutrients.sugar, 0..10) do |v|
          if    v == 0   then  0
          elsif v <  1.5 then  1
          elsif v <  3   then  2
          elsif v <  4.5 then  3
          elsif v <  6   then  4
          elsif v <  7.5 then  5
          elsif v <  9   then  6
          elsif v < 10.5 then  7
          elsif v < 12   then  8
          elsif v < 13.5 then  9
          else                    10
          end
        end
      end

      def fruits_vegetables
        # the text mentions % but here we use g/100ml
        # we'd need to either ask for %, ask for g/100g, or require a density ...
        score_value(@nutrients.fruits_vegetables, 0..10) do |v|
          if    v > 80 then 10
          elsif v > 60 then  4
          elsif v > 40 then  2
          else                   0
          end
        end
      end
    end
  end
end
