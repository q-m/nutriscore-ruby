require_relative 'general_score'

module Nutriscore
  module UK
    # this is for general products
    class SpecificScore < GeneralScore
      def score
        score = super
        # 'If a food or drink scores 11 or more ‘A’ points then it cannot score points for protein
        #  unless it also scores 5 points for fruit, vegetables and nuts.'
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
