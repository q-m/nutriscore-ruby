module Nutriscore
  module FR
    module DrinksScoreClass
      def score_class
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
