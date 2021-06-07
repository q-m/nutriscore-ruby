require_relative '../common/score'

module Nutriscore
  module UK
    # This is called 'C'-points in the documentation
    class PositiveScore < Nutriscore::Common::Score

      def initialize(nutrients, fibres_method: :aoac)
        super(nutrients)
        @fibres_method = fibres_method
      end

      def self.nutrient_keys
        [:fruits_vegetables_nuts, :fibres, :proteins]
      end

      def fruits_vegetables_nuts
        value = @nutrients.fruits_vegetables_nuts
        if   !value      then nil
        elsif value > 80 then 5
        elsif value > 60 then 2
        elsif value > 40 then 1
        else                  0
        end
      end

      def fibres
        value = @nutrients.fibres
        if @fibres_method == :aoac
          if   !value       then nil
          elsif value > 4.7 then 5
          elsif value > 3.7 then 4
          elsif value > 2.8 then 3
          elsif value > 1.9 then 2
          elsif value > 0.9 then 1
          else                   0
          end
        elsif @fibres_method == :nsp
          if   !value       then nil
          elsif value > 3.5 then 5
          elsif value > 2.8 then 4
          elsif value > 2.1 then 3
          elsif value > 1.4 then 2
          elsif value > 0.7 then 1
          else                   0
          end
        end
      end

      def proteins
        value = @nutrients.proteins
        if   !value       then nil
        elsif value > 8.0 then 5
        elsif value > 6.4 then 4
        elsif value > 4.8 then 3
        elsif value > 3.2 then 2
        elsif value > 1.6 then 1
        else                   0
        end
      end
    end
  end
end
