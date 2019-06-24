require_relative 'general_score'

module Nutriscore
  module FR
    # this is for general products
    class SpecificScore < GeneralScore
      def score
        score = super
        if score && score >= 11 && (n = @negative.fruits_vegetables_legumes_nuts) && n < 5
          # exclude protein score if there are not so much fruits(etc.)
          score + @positive.proteins
        else
          score
        end
      end
    end
  end
end
