module Nutriscore
  module UK
    module DrinksLessHealthy
      def less_healthy?
        # 'A drink is classified as 'less healthy' where it scores 1 point or more.'
        if score.min >= 1
          true
        elsif score.max < 1
          false
        else
          nil
        end
      end
    end
  end
end
