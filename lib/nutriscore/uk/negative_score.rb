require_relative '../common/score'

module Nutriscore
  module UK
    # This is called 'A'-points in the documentation
    class NegativeScore < Nutriscore::Common::Score

      def self.nutrient_keys
        [:energy, :fat_saturated, :sugar, :sodium]
      end

      def energy
        value = @nutrients.energy
        if   !value        then nil
        elsif value > 3350 then 10
        elsif value > 3015 then  9
        elsif value > 2680 then  8
        elsif value > 2345 then  7
        elsif value > 2010 then  6
        elsif value > 1675 then  5
        elsif value > 1340 then  4
        elsif value > 1005 then  3
        elsif value >  670 then  2
        elsif value >  335 then  1
        else                     0
        end
      end

      def fat_saturated
        value = @nutrients.fat_saturated
        if   !value      then nil
        elsif value > 10 then 10
        elsif value >  9 then  9
        elsif value >  8 then  8
        elsif value >  7 then  7
        elsif value >  6 then  6
        elsif value >  5 then  5
        elsif value >  4 then  4
        elsif value >  3 then  3
        elsif value >  2 then  2
        elsif value >  1 then  1
        else                   0
        end
      end

      def sugar
        value = @nutrients.sugar
        if   !value        then nil
        elsif value > 45   then 10
        elsif value > 40   then  9
        elsif value > 36   then  8
        elsif value > 31   then  7
        elsif value > 27   then  6
        elsif value > 22.5 then  5
        elsif value > 18   then  4
        elsif value > 13.5 then  3
        elsif value >  9   then  2
        elsif value >  4.5 then  1
        else                     0
        end
      end

      def sodium
        value = @nutrients.sodium
        value *= 1000 if value # comparison is in mg/100g
        if   !value       then nil
        elsif value > 900 then 10
        elsif value > 810 then  9
        elsif value > 720 then  8
        elsif value > 630 then  7
        elsif value > 540 then  6
        elsif value > 450 then  5
        elsif value > 360 then  4
        elsif value > 270 then  3
        elsif value > 180 then  2
        elsif value >  90 then  1
        else                    0
        end
      end
    end
  end
end
