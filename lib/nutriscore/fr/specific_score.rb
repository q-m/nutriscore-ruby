require_relative 'general_score'

module Nutriscore
  module FR
    # this is for general products
    class SpecificScore < GeneralScore
      def score
        score = super
        if score && @negative.score >= 11 && @positive.fruits_vegetables_nuts < 5
          # exclude protein score if there are not so much fruits(etc.)
          score + @positive.proteins
        else
          score
        end
      end
    end
  end
end
