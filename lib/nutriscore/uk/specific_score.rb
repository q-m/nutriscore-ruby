require_relative 'general_score'
require_relative '../common/range'

module Nutriscore
  module UK
    # this is for general products
    class SpecificScore < GeneralScore
      def score
        # 'If a food or drink scores 11 or more ‘A’ points then it cannot score points for protein
        #  unless it also scores 5 points for fruit, vegetables, nuts and pulses.'
        if @negative.score.min < 11 || @positive.fvnp.max >= 5
          @negative.score - @positive.score
        elsif @negative.score.max >= 11 && @positive.fvnp.min < 5
          @negative.score - @positive.score_without_proteins
        else
          Range.new(
            @negative.score.min - @positive.score.max,
            @negative.score.max - @positive.score_without_proteins.min
          )
        end
      end
    end
  end
end
