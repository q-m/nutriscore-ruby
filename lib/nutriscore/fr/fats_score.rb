require_relative '../common/score'
require_relative 'concerns/general_score_class'

module Nutriscore
  module FR
    # this is for vegetable and animal fats and oils
    class FatsScore < Nutriscore::Common::Score
      include GeneralScoreClass

      def self.nutrient_keys
        [:fat_saturated, :fat_total]
      end

      def score
        fat_saturated
      end

      def fat_saturated
        value = fat_saturated_pct
        if   !value      then nil
        elsif value < 10 then  0
        elsif value < 16 then  1
        elsif value < 22 then  2
        elsif value < 28 then  3
        elsif value < 34 then  4
        elsif value < 40 then  5
        elsif value < 46 then  6
        elsif value < 52 then  7
        elsif value < 58 then  8
        elsif value < 64 then  9
        else                  10
        end
      end

      private

      def fat_saturated_pct
        fat_saturated = @nutrients.fat_saturated
        fat_total = @nutrients.fat_total
        100 * fat_saturated / fat_total if fat_saturated && fat_total
      end
    end
  end
end
