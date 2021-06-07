module Nutriscore
  module Common
    # Range class that supports addition, substraction and comparison.
    # Assumes the objects that the range is composed of is a {{Numeric}}.
    #
    # Note that the end range is always included (+exclude_end+ is +false+).
    class Range < ::Range
      # Returns a {{Nutriscore::Common::Range}} object from a {{Numeric}} or {{Range}}.
      def self.wrap(a)
        if Numeric === a
          Range.new(a, a)
        elsif Range === a
          a
        elsif ::Range  === a
          Range.new(a.first, a.last)
        else
          raise ArgumentError
        end
      end

      def +(a)
        if Numeric === a
          Range.new(min + a, max + a)
        elsif ::Range === a
          Range.new(min + a.min, max + a.max)
        else
          raise ArgumentError
        end
      end

      def -(a)
        if Numeric === a
          Range.new(min - a, max - a)
        elsif ::Range === a
          Range.new(min - a.max, max - a.min)
        else
          raise ArgumentError
        end
      end

      def *(a)
        if Numeric === a
          Range.new(min * a, max * a)
        elsif ::Range === a
          Range.new(min * a.min, max * a.max)
        else
          raise ArgumentError
        end
      end

      def /(a)
        if Numeric === a
          Range.new(min / a, max / a)
        elsif ::Range === a
          Range.new(min / a.max, max / a.min)
        else
          raise ArgumentError
        end
      end

      def ==(a)
        if Numeric === a
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