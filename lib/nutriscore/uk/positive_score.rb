require_relative '../common/score'

module Nutriscore
  module UK
    # This is called 'C'-points in the documentation
    class PositiveScore < Nutriscore::Common::Score

      def initialize(nutrients, fibres_method: :aoac, **opts)
        super(nutrients, **opts)
        @fibres_method = fibres_method
      end

      def self.nutrient_keys
        [:fruits_vegetables_nuts, :fibres, :proteins]
      end

      def fruits_vegetables_nuts
        score_value(@nutrients.fruits_vegetables_nuts, 0..5) do |v|
          if    v > 80 then 5
          elsif v > 60 then 2
          elsif v > 40 then 1
          else              0
          end
        end
      end

      def fibres
        score_value(@nutrients.fibres, 0..5) do |v|
          if @fibres_method == :aoac
            if    v > 4.7 then 5
            elsif v > 3.7 then 4
            elsif v > 2.8 then 3
            elsif v > 1.9 then 2
            elsif v > 0.9 then 1
            else               0
            end
          elsif @fibres_method == :nsp
            if    v > 3.5 then 5
            elsif v > 2.8 then 4
            elsif v > 2.1 then 3
            elsif v > 1.4 then 2
            elsif v > 0.7 then 1
            else               0
            end
          end
        end
      end

      def proteins
        score_value(@nutrients.proteins, 0..5) do |v|
          if    v > 8.0 then 5
          elsif v > 6.4 then 4
          elsif v > 4.8 then 3
          elsif v > 3.2 then 2
          elsif v > 1.6 then 1
          else               0
          end
        end
      end

      def score_without_proteins
        (self.class.nutrient_keys - [:proteins]).map(&method(:public_send)).compact.reduce(&:+)
      end
    end
  end
end
