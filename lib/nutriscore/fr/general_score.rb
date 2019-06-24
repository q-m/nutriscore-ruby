require_relative '../common/nutrients'
require_relative 'concerns/general_score_class'
require_relative 'positive_score'
require_relative 'negative_score'

module Nutriscore
  module FR
    class GeneralScore
      include GeneralScoreClass

      attr_reader :positive, :negative

      def self.nutrient_keys
        PositiveScore.nutrient_keys | NegativeScore.nutrient_keys
      end

      def initialize(nutrients)
        @nutrients = Nutriscore::Common::Nutrients.wrap(nutrients)
        @positive = PositiveScore.new(@nutrients)
        @negative = NegativeScore.new(@nutrients)
      end

      def score
        if (negative = @negative.score) && (positive = @positive.score)
          negative - positive
        end
      end

      def inspect
        "#<#{self.class} score=#{score} " +
          "positive_score=#{@positive.inspect} negative_score=#{@negative.inspect}>"
      end
    end
  end
end
