require_relative '../../common/score_class_range'

module Nutriscore
  module FR
    module GeneralScoreClass
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
        elsif score < 0  then 'A'
        elsif score < 3  then 'B'
        elsif score < 11 then 'C'
        elsif score < 19 then 'D'
        else                  'E'
        end
      end
    end
  end
end
