require_relative '../common/nutrients'
require_relative 'positive_score'
require_relative 'negative_score'
require_relative 'concerns/general_less_healthy'

module Nutriscore
  module UK
    class GeneralScore
      include GeneralLessHealthy

      attr_reader :positive, :negative

      def self.nutrient_keys
        PositiveScore.nutrient_keys | NegativeScore.nutrient_keys
      end

      def initialize(nutrients, fibres_method: :aoac)
        @nutrients = Nutriscore::Common::Nutrients.wrap(nutrients)
        @positive = PositiveScore.new(@nutrients, fibres_method: fibres_method)
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
