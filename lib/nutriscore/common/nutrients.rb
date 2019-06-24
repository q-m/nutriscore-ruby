module Nutriscore
  module Common
    class Nutrients

      def self.wrap(o)
        if o.is_a?(Nutrients)
          o
        else
          Nutrients.new(o)
        end
      end

      def initialize(h)
        @h = h
      end

      private

      def method_missing(m)
        @h[m.to_sym]
      end
    end
  end
end
