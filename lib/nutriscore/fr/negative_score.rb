require_relative '../common/score'

module Nutriscore
  module FR
    class NegativeScore < Nutriscore::Common::Score

      def self.nutrient_keys
        [:energy, :fat_saturated, :sugar, :sodium]
      end

      def energy
        score_value(@nutrients.energy, 0..10) do |v|
          if    v > 3350 then 10
          elsif v > 3015 then  9
          elsif v > 2680 then  8
          elsif v > 2345 then  7
          elsif v > 2010 then  6
          elsif v > 1675 then  5
          elsif v > 1340 then  4
          elsif v > 1005 then  3
          elsif v >  670 then  2
          elsif v >  335 then  1
          else                 0
          end
        end
      end

      def fat_saturated
        score_value(@nutrients.fat_saturated, 0..10) do |v|
          if    v > 10 then 10
          elsif v >  9 then  9
          elsif v >  8 then  8
          elsif v >  7 then  7
          elsif v >  6 then  6
          elsif v >  5 then  5
          elsif v >  4 then  4
          elsif v >  3 then  3
          elsif v >  2 then  2
          elsif v >  1 then  1
          else                   0
          end
        end
      end

      def sugar
        score_value(@nutrients.sugar, 0..10) do |v|
          if    v > 45   then 10
          elsif v > 40   then  9
          elsif v > 36   then  8
          elsif v > 31   then  7
          elsif v > 27   then  6
          elsif v > 22.5 then  5
          elsif v > 18   then  4
          elsif v > 13.5 then  3
          elsif v >  9   then  2
          elsif v >  4.5 then  1
          else                 0
          end
        end
      end

      def sodium
        score_value(@nutrients.sodium, 0..10) do |v|
          if    v > 900 then 10
          elsif v > 810 then  9
          elsif v > 720 then  8
          elsif v > 630 then  7
          elsif v > 540 then  6
          elsif v > 450 then  5
          elsif v > 360 then  4
          elsif v > 270 then  3
          elsif v > 180 then  2
          elsif v >  90 then  1
          else                0
          end
        end
      end
    end
  end
end
