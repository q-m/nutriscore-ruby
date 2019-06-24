require_relative 'nutrients'

module Nutriscore
  module Common
    class Score
      attr_reader :nutrients

      def self.nutrient_keys
        []
      end

      def score
        self.class.nutrient_keys.map(&method(:public_send)).compact.reduce(&:+)
      end

      def initialize(nutrients)
        @nutrients = Nutrients.wrap(nutrients)
      end

      def inspect
        "#<#{self.class} score=#{score} #{inspect_nutrients}>"
      end

      private

      def inspect_nutrients
        self.class.nutrient_keys.map do |key|
          "#{key}=#{public_send(key)}"
        end.join(" ")
      end
    end
  end
end
