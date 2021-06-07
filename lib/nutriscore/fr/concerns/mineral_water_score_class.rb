require_relative '../../common/score_class_range'

module Nutriscore
  module FR
    module MineralWaterScoreClass
      def score_class
        Nutriscore::Common::ScoreClassRange.new('A', 'A')
      end
    end
  end
end
