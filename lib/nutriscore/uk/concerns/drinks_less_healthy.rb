module Nutriscore
  module UK
    module DrinksLessHealthy
      def less_healthy?
        # 'A drink is classified as 'less healthy' where it scores 1 point or more.'
        score >= 1
      end
    end
  end
end
