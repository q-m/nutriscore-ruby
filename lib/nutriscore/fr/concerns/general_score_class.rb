module Nutriscore
  module FR
    module GeneralScoreClass
      def score_class
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
