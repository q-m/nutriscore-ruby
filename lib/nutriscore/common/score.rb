require_relative 'nutrients'
require_relative 'range'

module Nutriscore
  module Common
    class Score
      attr_reader :nutrients

      def self.nutrient_keys
        []
      end

      def score
        self.class.nutrient_keys.map(&method(:public_send)).reduce(&:+)
      end

      def initialize(nutrients)
        @nutrients = Nutrients.wrap(nutrients)
      end

      def inspect
        "#<#{self.class} score=#{score} #{inspect_nutrients}>"
      end

      private

      def score_value(value, extremes)
        if value.nil?
          Range.wrap(extremes)
        else
          Range.new(yield(value.min), yield(value.max))
        end
      end

      def inspect_nutrients
        self.class.nutrient_keys.map do |key|
          "#{key}=#{public_send(key)}"
        end.join(" ")
      end
    end
  end
end
