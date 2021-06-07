module Nutriscore
  module UK
    module GeneralLessHealthy
      def less_healthy?
        # 'A food is classified as 'less healthy' where it scores 4 points or more.'
        if score.min >= 4
          true
        elsif score.max < 4
          false
        else
          nil
        end
      end
    end
  end
end
