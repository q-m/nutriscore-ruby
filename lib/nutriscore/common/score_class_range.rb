module Nutriscore
  module Common
    # Range of possible score classes.
    #
    # This is a standard Ruby {{::Range}} for {{String}}s with some additional helper
    # methods, similar to {{Nutriscore::Common::Range}} (without the computation parts).
    class ScoreClassRange < ::Range
      def ==(a)
        if String === a
          single == a
        else
          super
        end
      end

      def to_s
        if min == max
          min.to_s
        else
          super
        end
      end

      def inspect
        to_s
      end

      # Returns single value if possible, +nil+ if there is a range of values.
      def single
        min if min == max
      end
    end
  end
end