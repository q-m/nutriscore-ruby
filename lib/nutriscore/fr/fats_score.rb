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
        score_value(fat_saturated_pct, 0..10) do |v|
          if    v < 10 then  0
          elsif v < 16 then  1
          elsif v < 22 then  2
          elsif v < 28 then  3
          elsif v < 34 then  4
          elsif v < 40 then  5
          elsif v < 46 then  6
          elsif v < 52 then  7
          elsif v < 58 then  8
          elsif v < 64 then  9
          else              10
          end
        end
      end

      private

      def fat_saturated_pct
        fat_saturated = @nutrients.fat_saturated
        fat_total = @nutrients.fat_total
        fat_saturated * 100 / fat_total if fat_saturated && fat_total
      end
    end
  end
end
