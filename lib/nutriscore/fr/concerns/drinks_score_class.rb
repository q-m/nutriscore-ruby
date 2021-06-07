require_relative '../../common/score_class_range'

module Nutriscore
  module FR
    module DrinksScoreClass
      def score_class
        return nil if score.nil?

        Nutriscore::Common::ScoreClassRange.new(
          score_class_single(score.min), 
          score_class_single(score.max)
        )
      end

      private

      def score_class_single(score)
        if   !score      then nil
        # mineral water has 'A'
        elsif score < 2  then 'B'
        elsif score < 6  then 'C'
        elsif score < 10 then 'D'
        else                  'E'
        end
      end
    end
  end
end
