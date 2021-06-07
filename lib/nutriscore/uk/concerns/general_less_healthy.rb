module Nutriscore
  module UK
    module GeneralLessHealthy
      def less_healthy?
        # 'A food is classified as 'less healthy' where it scores 4 points or more.'
        score >= 4
      end
    end
  end
end
